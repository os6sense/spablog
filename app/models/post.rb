class Post < ActiveRecord::Base
  before_save :set_publication_date, if: :published?#, unless: :publication_date?

  scope :by_publication_date, -> { order(publication_date: :desc) }
  scope :published, -> { where(published: true) }
  scope :recent, -> { by_publication_date.limit(5) }

  private

  def set_publication_date
    self.publication_date = Time.now unless self.publication_date
  end

  def self.archive_list
    hash = {}

    published.by_publication_date.each do | post |
      year = post.publication_date.year
      month = post.publication_date.month

      hash[year] = {} unless hash[year]
      hash[year][month] = [] unless hash[year][month]

      hash[year][month] << post
    end

    hash
  end
end

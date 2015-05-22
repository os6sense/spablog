class AlterPostsPublicationDate < ActiveRecord::Migration
  def change
    change_column :posts, :publication_date, :datetime
  end
end

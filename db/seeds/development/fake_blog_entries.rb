
require 'faker'

class FakePost

  # Creates a fake post for seeding
  def initialize
    @created_date = Faker::Time.between(365.days.ago, Time.now)
    @updated_date = Faker::Time.between(@created_date  , Time.now)
    @published_date = Faker::Time.between(@created_date,Time.now )
  end

  def published
    true
  end

  def publication_date
    @published_date
  end

  def created_at
    @created_date
  end

  def updated_at
    @updated_date
  end

  def title
    [Faker::Hacker.adjective,
      Faker::Hacker.noun,
      Faker::Hacker.ingverb,
      Faker::Hacker.adjective,
      Faker::Hacker.noun].join ' '
  end

  def content
    tmp = ""
    (rand(30)+1).times do 
      tmp << generate_paragraph
    end
    tmp
  end
  private

  def rand_bool
    rand(1) > 0 ? true : false
  end

  def rand_image
    return ""
    case rand(20)
    when 1
      "<img src=\"#{Faker::Company.logo}\"/>"
     when 2
      "<img src=\"#{Faker::Avatar.image}\"/>"
    else
      ""
    end
  end

  def generate_paragraph
    ['<p>',
      rand_image,
      Faker::Hacker.say_something_smart,
      Faker::Company.bs,
      Faker::Lorem.paragraph(rand(5) + 1),
      '</p>'].join ' '
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative 'fake_blog_entries'

100.times do 
  fp = FakePost.new

  p = Post.new()
  p.title = fp.title
  p.content = fp.content
  p.published = true
  p.created_at = fp.created_at
  p.updated_at = fp.updated_at
  p.save

  p.publication_date = fp.publication_date
  p.save
end

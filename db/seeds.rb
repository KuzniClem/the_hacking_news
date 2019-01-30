# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Link.destroy_all
CommentOfComment.destroy_all
Comment.destroy_all

10.times do
  user = User.new
  first_name = Faker::Name.unique.first_name
  user.first_name = first_name
  user.last_name = Faker::Name.unique.last_name
  user.email = Faker::Internet.unique.safe_email(first_name)
  user.save
end

5.times do
  user = User.all.sample
  link = Link.new
  link.user = user
  link.url = Faker::Internet.url('example.com')
  link.save
end

10.times do
  link = Link.all.sample
  comment = Comment.new
  comment.user = User.all.sample
  comment.content = Faker::Lovecraft.paragraph
  comment.link = link
  comment.save
end

15.times do
  comment = Comment.all.sample
  comment_of_comment = CommentOfComment.new
  comment_of_comment.user = User.all.sample
  comment_of_comment.comment = comment
  comment_of_comment.content = Faker::Lovecraft.paragraph
  comment_of_comment.save
end

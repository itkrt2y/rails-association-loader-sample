# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


10.times do |i|
  user = ::User.create(name: "user #{i + 1}")

  rand(10).times do |i|
    blog = user.blogs.create(title: "#{user.name}, title #{i + 1}")

    rand(5).times do |i|
      blog.comments.create(body: "#{blog.title}, comment #{i + 1}")
    end
  end
end

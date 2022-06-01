# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


5.times do |i|
  user = ::User.create(name: "user #{i + 1}")

  rand(5..10).times do |j|
    blog = user.blogs.create(title: "#{user.name}, title #{j + 1}")

    rand(3..5).times do |k|
      blog.comments.create(body: "#{blog.title}, comment #{k + 1}")
    end
  end
end

5.times do |i|
  physician = ::Physician.create(name: "physician #{i}")
  rand(5..10).times do |j|
    physician.patients.create(name: "#{physician.name}, patient #{j}")
  end
end

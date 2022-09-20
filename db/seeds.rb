# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.test?

  User.create({ email: 'nazar@email.com', password: 'testtest', avatar: 'placeholder1.png', description: 'test desc' })
  User.create({ email: 'ivan@email.com', password: 'testtest', avatar: 'placeholder2.png', description: 'desc test' })

  ArtWork.create({ user_id: 1, title: 'test img 1', attachment: 'image1.png' })
  ArtWork.create({ user_id: 1, title: 'test img 2', attachment: 'image2.png' })
  ArtWork.create({ user_id: 2, title: 'test img 3', attachment: 'image3.png' })
end

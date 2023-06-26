# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: 'George Marcus',
  email: 'gmarcus@golfr.com',
  password: '123456',
  password_confirmation: '123456'
)

User.create!(
  name: 'Sergiu Apostu',
  email: 'sapostu@golfr.com',
  password: '123456',
  password_confirmation: '123456'
)

User.create!(
  name: 'Alex Tandrau',
  email: 'atandrau@golfr.com',
  password: '123456',
  password_confirmation: '123456'
)

rng = Random.new
now = Time.zone.today
User.all.each do |user|
  40.times do |i|
    Score.create!(
      user: user,
      total_score: rng.rand(66..200),
      played_at: now - 10.days + i.days
    )
  end
end

5.times do |i|
  User.create(
    username: "unnamed#{i}",
    email: "busko.bogdan#{i}@gmail.com",
    password: '123456'
  )
end

User.each do |user|
  Faker::Number.between(10, 50).times do
    user.posts.create!(
      title: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraph(10)
    )
  end
end

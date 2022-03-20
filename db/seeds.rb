@user = User.create(email: "a@a", password: "12345678", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")

puts "[seeds] User created"

20.times do |post|
  Post.create!(date: Date.today, rationale: "#{post.to_i + 1}th post rationale content", user_id: @user.id)
end

puts "[seeds] 20 posts have been created"
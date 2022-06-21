@user = User.create(
  email: "a@a", 
  password: "12345678", 
  password_confirmation: "12345678", 
  first_name: "Jon", 
  last_name: "Snow",
  phone: ENV["TWILIO_PHONE_NUMBER"]
)

puts "[seeds] User created"

AdminUser.create(
  email: "admin@a", 
  password: "12345678", 
  password_confirmation: "12345678", 
  first_name: "User", 
  last_name: "Admin",
  phone: ENV["TWILIO_PHONE_NUMBER"]
)

puts "[seeds] Admin created"

20.times do |post|
  Post.create!(
    date: Date.today, 
    rationale: "#{post.to_i + 1}th post rationale content", 
    user_id: @user.id, 
    overtime_request: 2.5
  )
end

puts "[seeds] 20 posts have been created"
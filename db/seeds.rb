@user = User.create(email: "a@a", password: "12345678", password_confirmation: "12345678", first_name: "Jon", last_name: "Snow")

puts "[seeds] User created"

@admin = AdminUser.create(email: "admin@a", password: "12345678", password_confirmation: "12345678", first_name: "Admin", last_name: "User")

puts "[seeds] AdminUser created"

20.times do |post|
  Post.create!(user_id: @user.id, date: Date.today, rationale: "#{post.to_i + 1}th post rationale content", overtime_request: 2.5)
end

puts "[seeds] 20 posts have been created"

20.times do |log|
  AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts "[seeds] 20 audit logs have been created"

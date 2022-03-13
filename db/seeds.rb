20.times do |post|
  Post.create!(date: Date.today, rationale: "#{post}th post rationale content")
end

puts "20 posts have been created"
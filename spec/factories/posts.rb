FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { "Factory rationale1" }
    user
    overtime_request { 2.5 }
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    rationale { "Factory rationale2" }
    user
    overtime_request { 0.5 }
  end

  factory :post_from_other_user, class: "Post" do
    date { Date.yesterday }
    rationale { "Post from other user" }
    user { FactoryBot.create(:non_authorized_user) } 
    overtime_request { 1.2 }
  end
end
FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { "Factory rationale1" }
    user
  end

  factory :second_post, class: "Post" do
    date { Date.yesterday }
    rationale { "Factory rationale2" }
    user
  end

  factory :post_from_other_user, class: "Post" do
    date { Date.yesterday }
    rationale { "Post from other user" }
    user { FactoryBot.create(:non_authorized_user) } 
  end
end
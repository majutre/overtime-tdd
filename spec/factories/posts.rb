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
end
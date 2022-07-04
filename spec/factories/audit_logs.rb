FactoryBot.define do
  factory :audit_log do
    user { nil }
    status { 1 }
    start_date { "2022-07-04" }
    end_date { "2022-07-04" }
  end
end

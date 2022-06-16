FactoryBot.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    first_name { 'Arya' }
    last_name { 'Stark' }
    email { generate :email }
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  factory :admin_user, class: "AdminUser" do
    first_name { 'Admin' }
    last_name { 'User' }
    email { generate :email }
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  factory :non_authorized_user, class: "User" do
    first_name { 'Non' }
    last_name { 'Authorized' }
    email { generate :email }
    password { "asdfasdf" }
    password_confirmation { "asdfasdf" }
  end
end
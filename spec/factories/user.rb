FactoryBot.define do
  factory :user, class: 'User' do
    email { Faker::Internet.free_email }
    password { '12345678' }
    username { Faker::Name.name }
  end
end
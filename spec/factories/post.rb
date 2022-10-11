FactoryBot.define do
  factory :post, class: 'Post' do
    content { Faker::Name.name }
  end
end
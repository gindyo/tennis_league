# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ranking_points_entry do
    expire_on "2014-06-12"
    total_points "9.99"
    player nil
  end
end

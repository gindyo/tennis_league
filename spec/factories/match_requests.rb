# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match_request do
    requested_by ""
    request_to ""
    match ""
  end
end

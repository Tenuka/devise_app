FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "fOoBaRfF"
    password_confirmation "fOoBaRfF"
  end

  factory :book do
    name "Lorem ipsum"
    genre_id "4"
  end
end

FactoryBot.define do
  factory :user do
    nickname                  {'あ'}
    email                     {'test@example'}
    password                  {'000000'}
    password_confirmation     {password}
  end
end
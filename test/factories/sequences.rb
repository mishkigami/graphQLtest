FactoryBot.define do
  sequence :numeric, aliases: [:price] do |n|
    0 + n
  end

  sequence :string, aliases: %i[name password ] do |n|
    "teststring#{n}"
  end

  sequence :text, aliases: %i[description] do |n|
    "sometext#{n}"
  end

  sequence :email do |n|
    "email-#{n}@email.com"
  end
end

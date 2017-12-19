FactoryBot.define do
  factory :address do
    street('123 TEST RD')
    city('PORTLAND')
    state('OREGON')
    zip(97206)
  end
end

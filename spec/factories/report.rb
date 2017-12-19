FactoryBot.define do
  factory :report do
    name('SMOKEY THE BEAR')
    date('2017.12.22')
    carrier('USPS')
    notes('Package wasnt left')
    code(1)
    price(199.99)
  end
end

class Seed

  def self.begin
    seed = Seed.new
    seed.generate_addresses
    seed.generate_reports
  end



  def generate_addresses
    20.times do |i|
      address = Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip
      )
      puts "Address #{i}: street is #{address.street}, city is '#{address.city}, state is '#{address.state}', and zip is '#{address.zip}'."
    end
  end

  def generate_reports
    100.times do |i|
      report = Report.create!(
        name: Faker::Name.name,
        date: Faker::Date.between(1.years.ago, Date.today),
        carrier: Faker::Hipster.word,
        notes: Faker::Hipster.sentence(2),
        code: rand(1..4),
        price: Faker::Number.decimal(2),
        address_id: rand((Address.first.id)..(Address.last.id)),
      )
      puts "Report #{i}: name is #{report.name}, date is '#{report.date}, carrier is '#{report.carrier}, notes is '#{report.notes}', code is '#{report.code}', price is '#{report.price}', and address_id is '#{report.address_id}'."
    end
  end
end

Seed.begin

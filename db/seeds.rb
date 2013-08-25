# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

include Faker

[Customer, Campaign].each do |a|
  a.delete_all
end

  5.times do
    a = Customer.new
    a.name = Company.name
    a.contact = Name.name
    a.address = Address.street_address
    a.balance = rand (1000..50000)
    a.phone = PhoneNumber.phone_number
    a.email = Internet.email
    a.manager_id = Manager.first!.id
    a.save
    puts a.inspect

  end

  status = ['New', 'Active', 'Finished']
  35.times do
    a = Campaign.new
    a.title = Company.catch_phrase
    a.start_date = DateTime.new(2013,rand(1..12),rand(1..28))
    a.end_date= a.start_date+rand(1..30)
    a.budget = rand (1000..5000)
    a.status = status[rand(0..2)]
    a.customer_id= Customer.first!.id + rand(0..Customer.count-1)
    a.save
    puts a.inspect

 end



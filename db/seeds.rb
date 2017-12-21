# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Contact.destroy_all

CSV.foreach(Rails.root.join('contacts.csv'), headers: true) do |row|
  p row
  Contact.create! do |contact|
  contact.first_name = row[0]
  contact.last_name = row[1]
  contact.email = row[2]
  contact.phone = row[3]
  contact.address_line_1 = row[4]
  contact.city = row[5]
  contact.province = row[6]
  contact.country_name = row[7]
  contact.postcode = row[8]
  contact.date_added = row[9]
  contact.how_did_you_hear_about_us = row[10]
  contact.what_is_your_budget = row[11]
  contact.what_is_your_favourite_color = row[12]
  puts "#{contact.first_name}, #{contact.last_name} saved"
  end
end
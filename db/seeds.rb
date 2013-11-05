# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Listing.delete_all

# For testing game/user stuff

test_users = User.create([
  {email: "SomeGuy@example.com", password: "password"},
  {email: "GuestUser@example.com", password: "gimmeyohouses"},
])

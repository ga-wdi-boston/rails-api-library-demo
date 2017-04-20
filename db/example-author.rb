# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end

Book.create(
  [
    { title: 'There and back again', author: 'Bilbo Baggins' },
    { title: '50 Shades of GA', author: 'Some Guy from Bahstahn' },
    { title: 'Antony Potter and the Prisoner of WDI' },
    { title: 'Example Title Numbah Two, Kid!', author: 'Big Papi' },
    { title: 'A Wacky Title' },
    { title: 'One Fish, Two Fish, Red Fish, Blue Fish', author: 'Dr Seuss' },
    { title: 'The BFG', author: 'Roald Dahl' },
    { title: 'Matilda', author: 'Roald Dahl' }
  ]
)

# Author.create(
#   [
#     { given_name: 'Roald', surname: 'Dahl' },
#     { given_name: 'Dr', surname: 'Seuss' },
#     { given_name: 'Bilbo', surname: 'Baggins' },
#     { given_name: 'Big', surname: 'Papi' },
#     { given_name: 'Some Guy From', surname: 'Bahstahn' }
#   ]
# )

# Book.create(
#   [
#     { title: 'There and back again', author_id: 3 },
#     { title: '50 Shades of GA', author_id: 4 },
#     { title: 'Antony Potter and the Prisoner of WDI' },
#     { title: 'Example Title Numbah Two, Kid!', author_id: 5 },
#     { title: 'A Wacky Title' },
#     { title: 'One Fish, Two Fish, Red Fish, Blue Fish', author_id: 2 },
#     { title: 'The BFG', author_id: 1 },
#     { title: 'Matilda', author_id: 1 }
#   ]
# )

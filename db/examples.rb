# frozen_string_literal: true

require 'csv'

Book.transaction do
  CSV.foreach(Rails.root + 'data/books.csv',
              headers: true,
              header_converters: -> (h) { h.downcase.to_sym }) do |book_row|
    book = book_row.to_hash
    Book.create book unless Book.exists? book
  end
end

# Author.create({given_name: "Sam", family_name:"Awesomeness"})
# Author.create({given_name: "Sam", family_name:"Awesomeness"})
# Author.create({given_name: "Sam", family_name:"Awesomeness"})
# Author.create({given_name: "Sam", family_name:"Awesomeness"})

authors = [{given_name: "Emma", family_name:"Gilbert"}, {given_name: "Stefanie", family_name:"Starfish"}, {given_name: "Jillian", family_name:"Cobbleweb"}]

Author.create(authors)

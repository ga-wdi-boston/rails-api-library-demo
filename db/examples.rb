# frozen_string_literal: true

require 'csv'

# Book.transaction do
#   CSV.foreach(Rails.root + 'data/books.csv',
#               headers: true,
#               header_converters: -> (h) { h.downcase.to_sym }) do |book_row|
#     book = book_row.to_hash
#     Book.create book unless Book.exists? book
#   end
# end

Author.create(
  [
    { given_name: 'Roald', surname: 'Dahl' },
    { given_name: 'Dr', surname: 'Seuss' },
    { given_name: 'Bilbo', surname: 'Baggins' },
    { given_name: 'Big', surname: 'Papi' },
    { given_name: 'Some Guy From', surname: 'Bahstahn' }
  ]
)

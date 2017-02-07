# frozen_string_literal: true

require 'csv'

# Book.transaction do
#   CSV.foreach(Rails.root + 'data/books.csv',
#               headers: true,
#               header_converters: ->(h) { h.downcase.to_sym }) do |book_row|
#     book = book_row.to_hash
#     next if Book.exists?(book)
#     Book.create!(book)
#   end
# end

def heinlein
  author_params = { given_name: 'Robert A.', family_name: 'Heinlein' }
  Author.find_or_create_by(author_params)
end

def orwell
  author_params = { given_name: 'George', family_name: 'Orwell' }
  Author.find_or_create_by(author_params)
end

def huxley
  author_params = { given_name: 'Aldous', family_name: 'Huxley' }
  Author.find_or_create_by(author_params)
end

Book.transaction do
  [
    { title: 'The Moon is a Harsh Mistress', author: heinlein },
    { title: 'Time Enough for Love', author: heinlein },
    { title: 'Starship Troopers', author: heinlein },
    { title: '1984', author: orwell },
    { title: 'Brave New World', author: huxley }
  ].each do |book_params|
    next if Book.exists? book_params
    Book.create!(book_params)
  end
end

Borrower.transaction do
  %w(alice bob charlie dana eliot franky gloria henry iulia).each do |name|
    borrower_params = {
      given_name: name,
      family_name: 'McFace'
    }
    next if Borrower.exists? borrower_params
    Borrower.create!(borrower_params)
  end
end

Loan.transaction do
  require 'date'

  20.times do
    borrower_params = {
      borrower: Borrower.all.sample,
      book: Book.all.sample,
      due_on: Date.today
    }

    next if Loan.exists? borrower_params
    Loan.create!(borrower_params)
  end
end

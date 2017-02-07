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

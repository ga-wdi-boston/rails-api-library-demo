class LoanSerializer < ActiveModel::Serializer
  attributes :id, :date, :borrower_id, :book_id
  # has_one :borrower
  # has_one :book
end

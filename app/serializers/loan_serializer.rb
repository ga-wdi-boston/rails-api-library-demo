class LoanSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :borrower
  has_one :book
end

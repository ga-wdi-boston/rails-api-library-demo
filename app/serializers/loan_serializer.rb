class LoanSerializer < ActiveModel::Serializer
  attributes :id, :date
  has_one :author
  has_one :book
end

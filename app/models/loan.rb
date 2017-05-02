class Loan < ApplicationRecord
  belongs_to :borrower, inverse_of: :loans
  belongs_to :book, inverse_of: :loans
end

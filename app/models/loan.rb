class Loan < ActiveRecord::Base
  belongs_to :author, inverse_of: :loans
  belongs_to :book, inverse_of: :loans
end

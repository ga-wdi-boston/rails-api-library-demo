class Borrower < ApplicationRecord
  has_many :loans, dependent: :destroy
  has_many :books, through: :loans
end

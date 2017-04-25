# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :borrower, inverse_of: :loans
  belongs_to :book, inverse_of: :loans

  validates :borrower, presence: true
  validates :book, presence: true
  validates :due_on, presence: true
end

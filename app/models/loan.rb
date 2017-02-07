# frozen_string_literal: true

class Loan < ApplicationRecord
  belongs_to :borrower
  belongs_to :book

  validates :borrower, presence: true
  validates :book, presence: true
  validates :due_on, presence: true
end

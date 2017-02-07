# frozen_string_literal: true

class Borrower < ApplicationRecord
  has_many :books, through: :loans
  has_many :loans
end

class Book < ApplicationRecord
  belongs_to :author
  has_many :loans, dependent: :destroy
  has_many :borrowers, through: :loans
end

class Book < ActiveRecord::Base
  has_many :authors, through: :loans
  has_many :loans
end

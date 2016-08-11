class Author < ActiveRecord::Base
  has_many :books, through: :loans
  has_many :loans
end

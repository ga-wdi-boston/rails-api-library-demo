# Author Model
class Author < ActiveRecord::Base
  has_many :books
end

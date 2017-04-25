# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :author
  has_many :borrowers, through: :loans
  has_many :loans, dependent: :destroy

  validates :title, presence: true
  validates :author_id, presence: true
end

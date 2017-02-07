# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :borrowers

  # belongs_to :author
  # side-loading a parent
  def author
    object.author.id
  end

  def borrowers
    object.borrowers.pluck(:id)
  end
end

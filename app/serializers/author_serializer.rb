# frozen_string_literal: true

class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name, :books

  # has_many :books
  # side-loading child record ids
  def books
    object.books.pluck(:id)
  end
end

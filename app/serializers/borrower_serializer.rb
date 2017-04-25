# frozen_string_literal: true

class BorrowerSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name, :books
  #
  # def books
  #   object.books.pluck(:id)
  # end
end

class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :surname, :given_name, :books
end

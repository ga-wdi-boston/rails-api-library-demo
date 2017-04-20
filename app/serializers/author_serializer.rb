class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name
end

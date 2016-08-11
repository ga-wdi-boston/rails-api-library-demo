class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :authors
end

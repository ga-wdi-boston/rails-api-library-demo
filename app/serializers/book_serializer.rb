class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title
end

class BorrowerSerializer < ActiveModel::Serializer
  attributes :id, :given_name, :family_name, :books
end

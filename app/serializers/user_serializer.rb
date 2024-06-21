class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :gender, :favorites
end

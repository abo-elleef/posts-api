class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name ,:job_title
end
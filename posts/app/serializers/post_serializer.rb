class PostSerializer < ActiveModel::Serializer
  attributes :id, :text, :nature, :created_at, :updated_at
  belongs_to :user
end
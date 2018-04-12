class Post < ApplicationRecord
  validates_presence_of :text, :user_id, :nature

  belongs_to :user
  enum nature: {user_post: '1', announcement: '2', poll: '3'}

end

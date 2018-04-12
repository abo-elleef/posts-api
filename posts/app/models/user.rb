class User < ApplicationRecord
  validates_presence_of :name, :job_title, :email

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end

class User < ActiveRecord::Base
  has_many :tickets
  has_many :comments
  has_secure_password
  validates :name, :email, presence: true

end

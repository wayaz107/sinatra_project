class User < ActiveRecord::Base
    has_many :travels
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
end 

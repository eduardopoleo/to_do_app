class User < ActiveRecord::Base
  has_many :projects
  has_many :tasks

  validates :user_name, presence: true, uniqueness:true
  validates :email, presence:true, uniqueness: true
end

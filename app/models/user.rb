class User < ActiveRecord::Base
  include Deadline

  has_many :projects
  has_many :tasks
  
  has_secure_password validations: false

  validates :user_name, presence: true, uniqueness:true, length: {  in: 3..10 }
  validates :password, presence:true, length: {in: 3..10}

  
  def projects_total 
    self.projects.where(erased: nil).size
  end
  
end

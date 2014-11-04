class User < ActiveRecord::Base
  has_many :projects
  has_many :tasks

  has_secure_password validations: false

  validates :user_name, presence: true, uniqueness:true
  validates :email, presence:true, uniqueness: true
  validates :password, presence:true

  def pending_tasks_total
    tasks = self.tasks.where(checked: nil, erased: nil)
    total_number = 0

    tasks.each do |task|
      if !task.project.erased
        total_number += 1
      end
    end

    total_number
  end

  def projects_total 
    self.projects.where(erased: nil).size
  end
  
end

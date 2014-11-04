class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :title, presence: true, length: {minimum: 3}

  def progress
    if self.tasks.where(erased: nil).size == 0
      0
    else
      self.tasks.where(checked: true, erased: nil).size*100/self.tasks.where(erased: nil).size
    end
  end

  def pending_tasks
    self.tasks.where(checked: nil, erased: nil).size
  end

end
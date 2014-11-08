class Project < ActiveRecord::Base
  include GeneralInfo
  belongs_to :user
  has_many :tasks

  validates :title, presence: true, length: {minimum: 3}
  validates :description, length: {maximum: 400}

  def progress
    if self.tasks.where(erased: nil).size == 0
      0
    else
      self.tasks.where(checked: true, erased: nil).size*100/self.tasks.where(erased: nil).size
    end
  end

end
class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :description, presence: true, length: {minimum: 3}

  def has_upcoming_deadline?
    if self.deadline
      (self.deadline.to_date - Date.today.to_date).to_i < 2
    end
  end

end
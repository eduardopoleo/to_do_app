class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :description, presence: true, length: {minimum: 3}
end
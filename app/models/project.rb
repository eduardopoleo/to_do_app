class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tasks

  validates :title, presence: true, length: {minimum: 3}

end
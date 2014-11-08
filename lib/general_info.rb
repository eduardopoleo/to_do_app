module GeneralInfo
  extend ActiveSupport::Concern

  included do
   
  end

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
  
   def upcoming_deadlines
    tasks = self.tasks.where(erased: nil, checked: nil)
    upcoming_deadlines = []

    tasks.each do |task|
      if !task.project.erased and task.has_upcoming_deadline?
        upcoming_deadlines << task
      end
    end
    upcoming_deadlines
  end

  def has_upcoming_deadlines?
    true if upcoming_deadlines.size > 0
  end
end
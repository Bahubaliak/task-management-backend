class Task < ApplicationRecord
  validates :name, presence: true
  validates :status, presence: true

  # validate :validate_todo_percentage

  def validate_todo_percentage
    if status == 'To Do' && Task.where(status: 'To Do').count >= Task.count / 2
      errors.add(:base, "Cannot create more 'To Do' tasks when existing 'To Do' tasks are >= 50% of total tasks")
    end
  end
end

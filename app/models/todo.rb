class Todo < ApplicationRecord
  validates :task, presence: true
  has_many :reminders
end

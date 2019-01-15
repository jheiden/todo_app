class Todo < ApplicationRecord
  validates :task, presence: true
  belongs_to :user
  # adding association to user
end

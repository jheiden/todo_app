class Todo < ApplicationRecord
  validates :task, presence: true, uniqueness: { case_sensitive: false }
  belongs_to :user
  # adding association to user
end

class Task < ApplicationRecord

  validates :title, length: { minimum: 3   }, presence: true
  validates :priority, inclusion: 0..5, presence: true
  validates :status,  presence: true
  enum status: [ :open, :closed, :resolved ]

  paginates_per  3

end

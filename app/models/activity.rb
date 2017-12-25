class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :passes
  scope :active, -> { where(is_active: true) }
end

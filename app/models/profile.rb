class Profile < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true
  validates :contact_email, presence: true
  validates :bio, presence: true
  validates :mentoring_needs, presence: true
end
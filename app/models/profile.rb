class Profile < ActiveRecord::Base
  belongs_to :user
  validates :first_name, presence: true
  validates :contact_email, presence: true
  validates :bio, presence: true
  validates :mentoring_needs, presence: true
  validates_length_of :coding_languages,  minimum: 1, maximum: 1000
  validates_length_of :bio,  minimum: 1, maximum: 1000
  validates_length_of :mentoring_needs,  minimum: 1, maximum: 1000
end
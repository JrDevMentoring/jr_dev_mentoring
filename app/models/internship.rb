class Internship < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description, :deadline, :application_link, :user

  scope :active, -> { where('deadline > ?', Date.today) }
  scope :expired, -> { where('deadline < ?', Date.today) }

  def active?
    deadline > Date.today
  end
end

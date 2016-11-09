class Internship < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description, :deadline, :application_link, :user

end

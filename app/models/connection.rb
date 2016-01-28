class Connection < ActiveRecord::Base #todo remove
  validates :your_name, presence: true
  validates :email, presence: true
  validates :connections_name, presence: true
end
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  belongs_to :plan
  has_one :profile

  validates :plan_id, presence: true #todo I need to write a validation test to check to make sure every user is assigned a plan
  
  def self.mentees
    User.joins(:profile).where("users.plan_id=2 and profiles.not_available=?", false)
  end
  
  def self.mentors
    User.joins(:profile).where("users.plan_id=1 and profiles.not_available=?", false)
  end
end

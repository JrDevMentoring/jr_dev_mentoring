class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  belongs_to :plan
  has_one :profile
  
  def self.mentees
    User.where(plan_id: 2)
  end
  
  def self.mentors
    User.where(plan_id: 1)
  end
end

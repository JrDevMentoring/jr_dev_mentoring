class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :plan
  has_one :profile

  has_many :internships, dependent: :destroy

  scope :mentors, -> {joins(:profile).where("profiles.not_available=? and 'mentor'=ANY(profiles.plan_types)", false)}
  scope :mentees, -> {joins(:profile).where("profiles.not_available=? and 'mentee'=ANY(profiles.plan_types)", false)}


  def mentor?
    plan_types.include? 'mentor'
  end

  def mentee?
    plan_types.include? 'mentee'
  end

  Profile::PLAN_TYPES.each do |type|
    define_method("#{type}?") do
      profile.plan_types.include? type if profile
    end
  end

end

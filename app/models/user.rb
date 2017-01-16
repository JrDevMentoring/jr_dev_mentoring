class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  PLAN_TYPES = %w{mentor mentee}

  has_one :profile

  has_many :internships, dependent: :destroy
  validate :valid_plan_types

  def self.mentees
    User.joins(:profile, :plan).where("plans.name='mentee' and profiles.not_available=?", false)
  end

  scope :mentors, -> {joins(:profile).where("profiles.not_available=? and 'mentor'=ANY(plan_types)", false)}
  scope :mentees, -> {joins(:profile).where("profiles.not_available=? and 'mentee'=ANY(plan_types)", false)}

  # def self.mentees
  #   User.joins(:profile, :plan).where("plans.name='mentee' and profiles.not_available=?", false)
  # end
  #
  # def self.mentors
  #   User.joins(:profile, :plan).where("plans.name='mentor' and profiles.not_available=?", false)
  # end

  def mentor?
    plan_types.include? 'mentor'
  end

  def mentee?
    plan_types.include? 'mentee'
  end

  PLAN_TYPES.each do |type|
    define_method("#{type}?") do
      plan_types.include? type
    end
  end

  def valid_plan_types
    plan_types.each do |type|
      errors.add(:plan_types, 'invalid plan entered') unless PLAN_TYPES.include? type
    end
  end
end

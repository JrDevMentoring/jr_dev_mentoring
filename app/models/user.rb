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

  def valid_plan_types
    errors.add(:plan_types, 'invalid plan entered') unless plan_types.empty? || PLAN_TYPES.include?(*plan_types)
  end
end

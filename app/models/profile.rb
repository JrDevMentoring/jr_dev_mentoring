class Profile < ActiveRecord::Base
  belongs_to :user

  PLAN_TYPES = %w{mentor mentee}

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact_email, presence: true
  validates :bio, presence: true
  validates :mentoring_needs, presence: true, if: :mentee?
  validates_length_of :coding_languages,  minimum: 1, maximum: 500
  validates_length_of :bio,  minimum: 1, maximum: 1000
  validates_length_of :mentoring_needs,  minimum: 1, maximum: 500, if: :mentee?
  validate :valid_plan_types

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :square => '200x200#' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def valid_plan_types
    plan_types.each do |type|
      errors.add(:plan_types, 'invalid plan entered') unless PLAN_TYPES.include? type
    end
  end

  PLAN_TYPES.each do |type|
    define_method("#{type}?") do
      plan_types.include? type
    end
  end
end

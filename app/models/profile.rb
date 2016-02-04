class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :contact_email, presence: true
  validates :bio, presence: true
  validates :mentoring_needs, presence: true
  validates_length_of :coding_languages,  minimum: 1, maximum: 500
  validates_length_of :bio,  minimum: 1, maximum: 1000
  validates_length_of :mentoring_needs,  minimum: 1, maximum: 500

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :square => '200x200#' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  

end
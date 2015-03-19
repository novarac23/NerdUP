class Post < ActiveRecord::Base
  has_attached_file :nerd, :styles => { :medium => "800x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :nerd, :content_type => /\Aimage\/.*\Z/
  validates :nerd, :attachment_presence => true
  validates_with AttachmentSizeValidator, :attributes => :nerd, :less_than => 1.megabytes

  belongs_to :user
  has_many :comments

  scope :get_all_recent_nerds, -> { order('created_at DESC') }

  acts_as_votable
end

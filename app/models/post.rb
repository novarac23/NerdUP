class Post < ActiveRecord::Base
  has_attached_file :nerd, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :nerd, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  scope :get_all_recent_nerds, -> { order('created_at DESC').limit(4) }

end

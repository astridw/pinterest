class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :photo, styles: {medium: '400x400#'}
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  acts_as_votable
end

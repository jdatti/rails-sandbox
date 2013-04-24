class Song < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :body, :published, :title, :mp3, :mp3_file_name, :user_id

  has_attached_file :mp3,
    :url => "/uploads/songs/:id/:style/:basename.:extension",
    :path => ":rails_root/public/uploads/songs/:id/:style/:basename.:extension"

  validates_attachment_presence :mp3
  validates_attachment_content_type :mp3, :content_type => [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ]
  validates_attachment_size :mp3, :less_than => 10.megabytes


end

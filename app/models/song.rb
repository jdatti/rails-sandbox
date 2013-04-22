class Song < ActiveRecord::Base
  attr_accessible :body, :published, :title, :upload_path
end

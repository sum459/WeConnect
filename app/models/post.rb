class Post < ApplicationRecord

 belongs_to :user
 acts_as_votable
 acts_as_commontable dependent: :destroy
 

 mount_uploader :avatar, AvatarUploader
 serialize :avatar, JSON
 mount_uploader :video, VideoUploader 
 serialize :video, JSON 

end

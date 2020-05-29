class Post < ApplicationRecord
  belongs_to :user 
  has_many :comments
  
 
  rescue => exception
    

  validates :content, presence: true, unless: :image?
  validates :text,  presence: true
  
  
  mount_uploader :image, ImageUploader
end

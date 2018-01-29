class Post < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :comments, dependent: :destroy
end

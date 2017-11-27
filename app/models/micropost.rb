class Micropost < ApplicationRecord
  belongs_to :user
  scope :order_post, ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.micropost.size}
  validate  :picture_size
  scope :by_user, ->(id) {where("user_id= ?", id)}

  private

  def picture_size
    return unless picture.size > Settings.micropost.size_img.megabytes
    errors.add :picture, t("models.micropost.advice")
  end
end

class Item < ApplicationRecord
  validates :name, length: { maximum: 30 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :status, presence: true
  mount_uploaders :images, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :liked_items, through: :likes, source: :item
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  enum status: { 募集中: 0, 募集終了: 1 }

  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      item_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
  end
end

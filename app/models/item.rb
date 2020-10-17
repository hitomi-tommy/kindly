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

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and item_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        item_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end
end

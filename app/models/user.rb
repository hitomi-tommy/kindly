class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable
  has_many :items
  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  mount_uploader :icon, ImageUploader

  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, length: { maximum: 500 }
  attr_accessor :current_password

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end

end

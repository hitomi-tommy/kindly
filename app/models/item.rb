class Item < ApplicationRecord
  validates :name, length: { maximum: 30 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :status, presence: true
  mount_uploaders :images, ImageUploader
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :liked_items, through: :likes, source: :item
end

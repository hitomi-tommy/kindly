class Comment < ApplicationRecord
  belongs_to :item
  has_many :notifications, dependent: :destroy
  validates :content, presence: true
end

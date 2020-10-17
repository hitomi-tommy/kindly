class Comment < ApplicationRecord
  belongs_to :item
  has_many :notifications, dependent: :destroy
end

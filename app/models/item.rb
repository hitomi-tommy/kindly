class Item < ApplicationRecord
  validates :name, length: { maximum: 30 }, presence: true
  validates :description, length: { maximum: 500 }, presence: true
  validates :status, presence: true
end

class Item < ApplicationRecord
  validates :status, presence: true
end

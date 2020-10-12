class Item < ApplicationRecord
  belongs_to :store
  has_many :item_images
end

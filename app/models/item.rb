class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :product_name,    presence: true
  validates :description,     presence: true
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :burden_id,       presence: true
  validates :prefectures_id,  presence: true
  validates :shipment_day_id, presence: true
  validates :price,           presence: true
  validates :image,           presence: true
end

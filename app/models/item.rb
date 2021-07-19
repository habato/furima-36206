class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  validates :product_name,    presence: true
  validates :description,     presence: true
  validates :category_id,     numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id,       numericality: { other_than: 1, message: "can't be blank"} 
  validates :burden_id,       numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefectures_id,  numericality: { other_than: 0, message: "can't be blank"} 
  validates :shipment_day_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :price,           presence: true
  validates :image,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipment_day
end

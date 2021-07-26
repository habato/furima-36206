class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description

    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :prefectures_id
      validates :shipment_day_id
    end

    with_options format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                 inclusion: { in: 300..9_999_999, message: 'is out of setting range' } do
      validates :price
    end
  end

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

  def self.search(search)
    if search != ''
      Item.where('product_name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end

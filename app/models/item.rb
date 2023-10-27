class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_date

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping_cost, presence: true
  validates :shipping_region, presence: true
  validates :shipping_days, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  validates :category_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :item_status_id, numericality: { other_than: 0 }
  validates :shipping_cost_id, numericality: { other than: 0 }
  validates :shipping_date_id, numericality: { other_than: 0 }


end

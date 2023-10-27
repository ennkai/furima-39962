class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping_cost, presence: true
  validates :shipping_region, presence: true
  validates :shipping_days, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end

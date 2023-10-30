class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user

  belongs_to :category
  belongs_to :prefecture
  belongs_to :situation
  belongs_to :load
  belongs_to :delivery
  

  validates :title, presence: true
  validates :explanation, presence: true
  validates :category, presence: true
  validates :situation_id, presence: true
  validates :load_id, presence: true
  validates :prefecture, presence: true
  validates :delivery_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  validates :category_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :situation_id, numericality: { other_than: 0 }
  validates :load_id, numericality: { other_than: 0 }
  validates :delivery_id, numericality: { other_than: 0 }

  attribute :quantity, :integer, default: 0

  def sold_out?
    return quantity == 0
  end
end



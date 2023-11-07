class RecordForm
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :telephone, format: { with: /\A[0-9]{10,11}\z/ }
  validates :token, presence: true


  def save
    if valid?
      record = Record.create(user_id: user_id, item_id: item_id)
      Payment.create(record_id: record.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone: telephone)
      return true
    else
      return false
    end
  end
end



class Load < ActiveHash::Base
  self.data = [
    { id: 1, title: '---' },
    { id: 2, title: '着払い(購入者負担)' },
    { id: 3, title: '送料込み(出品者負担)' }
  ]

  include ActiveHash::Associations
  has_many :items

end
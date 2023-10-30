class Delivery < ActiveHash::Base
  self.data = [
    { id: 0, title: '--' },
    { id: 1, title: '1~2日で発送' },
    { id: 2, title: '2~3日で発送' },
    { id: 3, title: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
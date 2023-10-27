class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 0, title: '--' },
    { id: 1, title: '新品、未使用' },
    { id: 2, title: '未使用品に近い' },
    { id: 3, title: '目立った傷や汚れなし' },
    { id: 4, title: 'やや傷や汚れあり' },
    { id: 5, title: '傷や汚れあり' },
    { id: 6, title: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end
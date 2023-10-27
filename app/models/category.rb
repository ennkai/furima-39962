class Category < ActiveHash::Base

  self.data = [
    { id: 0, title: '--' },
    { id: 1, title: 'レディース' },
    { id: 2, title: 'メンズ' },
    { id: 3, title: 'ベビー・キッズ' },
    { id: 4, title: 'インテリア・住まい・小物' },
    { id: 5, title: '本・音楽・ゲーム' },
    { id: 6, title: 'おもちゃ・ホビー・グッズ' },
    { id: 7, title: '家電・スマホ・カメラ' },
    { id: 8, title: 'スポーツ・レジャー' },
    { id: 9, title: 'ハンドメイド' },
    { id: 10, title: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
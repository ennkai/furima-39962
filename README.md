## users テーブル

| Columu                 | Type       | Options                      |
|------------------------|------------|------------------------------|
| nickname               | string     | null: false                  |
| email                  | string     | null: false, unique: true    |
| encrypted_password     | string     | null: false                  |
| birth_date             | date       | null: false                  |
| first_name             | string     | null: false                  |
| last_name              | string     | null: false                  |
| first_name_kana        | string     | null: false                  |
| last_name_kana         | string     | null: false                  |

### Association
- has_many :items



## items テーブル

| Columu                 | Type       | Options                          |
|------------------------|------------|----------------------------------|
| title                  | string     | null: false                      |
| explanation            | text       | null: false                      |
| price                  | integer    | null: false                      |
| situation_id           | integer    | null: false                      |
| category_id            | integer    | null: false                      |
| user                   | references | null: false, foreign_key: true   |
| delivery_id            | integer    | null: false                      |
| load_id                | integer    | null: false                      |
| prefecture             | integer    | null: false                      |

### Association
- belongs_to :user
- has_one :record
- has_one :information



## records テーブル


| Columu                 | Type           | Options                           |
|------------------------|----------------|-----------------------------------|
| information            | references     | null: false, foreign_key: true    |


### Association
- belongs_to :item
- has_one :information



## informations テーブル


| Columu                 | Type       | Options                           |
|------------------------|------------|-----------------------------------|
| postal_code            | string     | null: false                       |
| prefecture_id          | string     | null: false, foreign_key: true    |
| city                   | string     | null: false                       |
| house_number           | string     | null: false                       |
| building_name          | string     |                                   |
| telephone              | string     | null: false                       |
| item                   | references | null: false, foreign_key: true    |
| user                   | references | null: false, foreign_key: true    |


### Association

- belongs_to :record
- has_one :item
## user テーブル

| Columu                 | Type       | Options                      |
|------------------------|------------|------------------------------|
| nickname               | string     | null: false                  |
| email                  | string     | null: false, unique: true    |
| encrypted_password     | string     | null: false                  |
| telephone              | string     | null: false, unique: true    |
| birth_date             | date       | null: false                  |
| first_name             | string     | null: false                  |
| last_name              | string     | null: false                  |
| first_name_kana        | string     | null: false                  |
| last_name_kana         | string     | null: false                  |


## item テーブル

| Columu                 | Type       | Options                          |
|------------------------|------------|----------------------------------|
| title                  | string     | null: false                      |
| explanation            | string     | null: false                      |
| price                  | string     | null: false                      |
| situation              | string     | null: false                      |
| category               | string     | null: false                      |
| image                  | text       | null: false                      |
| user                   | references | null: false, foreign key: true   |
| delivery               | string     | null: false                      |  



## record テーブル


| Columu                 | Type           | Options                           |
|------------------------|----------------|-----------------------------------|
| item                   | references     | null: false, foreign key: true    |
| user                   | references     | null: false, foreign key: true    |



## information テーブル


| Columu                 | Type       | Options                           |
|------------------------|------------|-----------------------------------|
| postal_code            | string     | null: false                       |
| prefecture             | string     | null: false                       |
| city                   | string     | null: false                       |
| house_number           | string     | null: false                       |
| building_name          | string     | null: false                       |
| telephone              | string     | null: false                       |
| item                   | references | null: false, foreign key: true    |
| user                   | references | null: false, foreign key: true    |


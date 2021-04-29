# テーブル設計

## usersテーブル

| Column             | Type   | Options                 |
| ----------         | ------ | -----------             |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |
| family_name        | string | null: false             |
| first_name         | string | null: false             |
| family_name_kana   | string | null: false             |
| first_name_kana    | string | null: false             |
| birthday           | date   | null: false             |

### Association

- has_many :items
- has_many :purchase_histories


## itemsテーブル

| Column             | Type       | Options           |
| ----------         | ------     | -----------       |
| name               | string     | null: false       |
| introduction       | text       | null: false       |
| price              | integer    | null: false       |
| category_id        | integer    | null: false       |
| item_condition_id  | integer    | null: false       |
| postage_type_id    | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| preparation_day_id | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history

### Active hash

- belongs_to :category
- belongs_to :item_condition
- belongs_to :postage_type
- belongs_to :prefecture_id
- belongs_to :preparation_day

## addressesテーブル

| Column          | Type       | Options           |
| ----------      | ------     | ---------------   |
| post_code       | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| phone_number    | string     | null: false       |
| building_name   | string     | ---------------   |
| purchase_history| references | foreign_key: true |

### Association

- belongs_to :purchase_history

### Active hash

- belongs_to :prefecture_id

## purchase_historiesテーブル

| Column         | Type       | Options           |
| ----------     | ------     | ----------------- |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ----------         | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchase_history


## itemsテーブル

| Column             | Type       | Options     |
| ----------         | ------     | ----------- |
| item_image         | string     | null: false |
| name               | string     | null: false |
| introduction       | text       | null: false |
| price              | integer    | null: false |
| user               | references | ----------- |
| categories         | integer    | null: false |
| item_condition     | integer    | null: false |
| postage_type       | integer    | null: false |
| ship_from          | integer    | null: false |
| preparation_day    | integer    | null: false |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :item_condition
- belongs_to :postage_type
- belongs_to :ship_from
- belongs_to :preparation_day
- has_one :purchase_history

## buyテーブル

| Column         | Type       | Options     |
| ----------     | ------     | ----------- |
| post_code      | string     | null: false |
| prefecture     | integer    | null: false |
| city           | string     | null: false |
| house_number   | string     | null: false |
| phone_number   | string     | null: false |
| building_name  | string     | null: false |


## purchase_historyテーブル

| Column         | Type       | Options     |
| ----------     | ------     | ----------- |
| user           | references | ----------- |
| item           | references | ----------- |

### Association

- belongs_to :user
- belongs_to :item

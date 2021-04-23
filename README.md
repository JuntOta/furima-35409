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
- has_many :buy


## itemsテーブル

| Column             | Type       | Options     |
| ----------         | ------     | ----------- |
| item_image         | string     | null: false |
| name               | string     | null: false |
| introduction       | text       | null: false |
| price              | integer    | null: false |
| user               | references | ----------- |
| categories         | references | ----------- |
| item_condition     | references | ----------- |
| postage_type       | references | ----------- |
| ship_from          | references | ----------- |
| preparation_day    | references | ----------- |

### Association

- belongs_to :user
- has_one :buy
- belongs_to :category
- belongs_to :item_condition
- belongs_to :postage_type
- belongs_to :ship_from
- belongs_to :preparation_day


## categoriesテーブル

| Column       | Type       | Options     |
| ----------   | ------     | ----------- |
| name         | string     | null: false |

### Association

- has_many :items

## item_conditionsテーブル

| Column          | Type       | Options     |
| ----------      | ------     | ----------- |
| item_condition  | string     | null: false |

### Association

- has_many :items

## postage_typesテーブル

| Column         | Type       | Options     |
| ----------     | ------     | ----------- |
| postage_type   | string     | null: false |

### Association

- has_many :items

## ship_fromテーブル

| Column       | Type       | Options     |
| ----------   | ------     | ----------- |
| ship_from    | string     | null: false |

### Association

- has_many :items

## preparation_daysテーブル

| Column           | Type       | Options     |
| ----------       | ------     | ----------- |
| preparation_day  | string     | null: false |

### Association

- has_many :items


## buyテーブル

| Column         | Type       | Options     |
| ----------     | ------     | ----------- |
| post_code      | string     | null: false |
| prefecture     | integer    | null: false |
| city           | string     | null: false |
| house_number   | string     | null: false |
| phone_number   | string     | null: false |
| building_name  | string     | null: false |
| user           | references | ----------- |
| item           | references | ----------- |

### Association

- belongs_to :user
- belongs_to :item
- has_one :credit_cards

## credit_cardsテーブル

| Column          | Type       | Options     |
| ----------      | ------     | ----------- |
| card_number     | string     | null: false |
| card_month      | integer    | null: false |
| card_year       | integer    | null: false |
| security_code   | integer    | null: false |
| buy             | references | ----------- |

- belongs_to :buy
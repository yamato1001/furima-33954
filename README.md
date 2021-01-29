# README

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| first_name           | string | null: false |
| last_name            | string | null: false |
| first_name_kana      | string | null: false |
| last_name_kana       | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :logs

## items テーブル

| Column               | Type         | Options                        |
| -------------------- | ------------ | ------------------------------ |
| title                | string       | null: false                    |
| concept              | text         | null: false                    |
| category_id          | integer      | null: false                    |
| product_condition_id | integer      | null: false                    |
| shipping_charges_id  | integer      | null: false                    |
| shipping_area_id     | integer      | null: false                    |
| days_to_ship_id      | integer      | null: false                    |
| price                | integer      | null: false                    |
| user                 | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :logs

## comments テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| text   | text      | null: false                    |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shippings テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| postal_code            | string    | null: false                    |
| prefectures_id         | integer   | null: false                    |
| municipality           | string    | null: false                    |
| address                | string    | null: false                    |
| building_name          | string    |                                |
| phone_number           | string    | null: false                    |
| logs                   | reference | null: false, foreign_key: true |

### Association

- belongs_to :logs

## logs テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| user                   | reference | null: false, foreign_key: true |
| item                   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shippings
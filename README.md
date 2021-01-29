# README

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| name(kana) | string | null: false |
| birthday   | integer| null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchase

## items テーブル

| Column            | Type         | Options                        |
| ----------------- | ------------ | ------------------------------ |
| title             | string       | null: false                    |
| concept           | text         | null: false                    |
| category          | string       | null: false                    |
| product_condition | string       | null: false                    |
| shipping_charges  | string       | null: false                    |
| shipping_area     | string       | null: false                    |
| days_to_ship      | string       | null: false                    |
| price             | integer      | null: false                    |
| user_id           | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| text   | text      | null: false                    |
| user_id| reference | null: false, foreign_key: true |
| item_id| reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchase テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| card_information       | integer   | null: false                    |
| expiration_date(month) | integer   | null: false                    |
| expiration_date(year)  | integer   | null: false                    |
| security_code          | integer   | null: false                    |
| postal_code            | integer   | null: false                    |
| prefectures            | string    | null: false                    |
| municipality           | string    | null: false                    |
| address                | integer   | null: false                    |
| building_name          | string    |                                |
| phone_number           | integer   | null: false                    |
| user_id                | reference | null: false, foreign_key: true |
| item_id                | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
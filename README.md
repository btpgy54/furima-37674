# テーブル設計

## users テーブル

| Column                          | Type    | Options                   |
| ------------------------------- | ------- | ------------------------- |
| nickname                        | string  | null: false               |
| email                           | string  | null: false, unique: true |
| encrypted_password              | string  | null: false               |
| encrypted_password_confirmation | string  | null: false               |
| last_name                       | string  | null: false               |
| first_name                      | string  | null: false               |
| last_name_kana                  | string  | null: false               |
| first_name_kana                 | string  | null: false               |
| birthday                        | date    | null: false               |

### Association

- has_many :items

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| items_name       | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | string     | null: false                    |
| condition_id     | string     | null: false                    |
| shipping_fee_id  | string     | null: false                    |
| shipping_from_id | string     | null: false                    |
| shipping_date_id | string     | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_one :purchase_history
- belongs_to :user

## destination テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchase_history テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
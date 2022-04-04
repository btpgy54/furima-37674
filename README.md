# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password_confirmation | string | null: false |
| last_name             | string | null: false |
| first_name            | string | null: false |
| last_name_kana        | string | null: false |
| first_name_kana       | string | null: false |
| birthday              | string | null: false |

### Association

- has_many :items

## items テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
| items_image   | string     | null: false                    |
| items_name    | string     | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| shipping_from | string     | null: false                    |
| shipping_date | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs to :user

## destination テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| postcode     | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## card テーブル

| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| expired_at    | integer    | null: false                    |
| security_code | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
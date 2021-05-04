# テーブル設計

## users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association

- has_many :diaries
<br />
<br />
<br />

## diaries テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| text            | string     |                                |
| weight          | float      |                                |
| user            | references | null: false, foreign_key: true |
| feed_management | references | null: false, foreign_key: true |
| created_on      | date       | null: false, unique: true      |

### Association

- belongs_to :user
- belongs_to :feed_management
- has_many :diary_checks
- has_many :check_lists, through: :diary_checks
<br />
<br />
<br />

## diary_checks テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| check_list      | references | null: false, foreign_key: true |
| diary           | references | null: false, foreign_key: true |

### Association

- belongs_to :diary
- belongs_to :check_list
<br />
<br />
<br />

## check_lists テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| list            | string     | null: false, unique: true      |

### Association

- has_many :diary_checks
- has_many :diaries, through: :diary_checks
<br />
<br />
<br />

## feed_managements テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| yesterday_leftover | integer     | default: 0, null: false        |
| morning_addition   | integer     | default: 0, null: false        |
| noon_addition      | integer     | default: 0, null: false        |
| evening_addition   | integer     | default: 0, null: false        |
| today_leftover     | integer     | default: 0, null: false        |
| amount_eaten       | integer     | null: false                    |
| created_on         | date        | null: false, unique: true      |

### Association

- has_many :diary_checks
- has_many :diaries, through: :diary_checks
<br />
<br />
<br />

## shopping_lists テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| item_name          | string      | null: false, unique: true      |


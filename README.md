# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association
- has_many :diaries
- has_many :foods


## foods テーブル
| Column             | Type    | Options     |
| ------------------ | --------| ----------- |
| category_id        | integer | null: false |
| food_name          | string  | null: false |
| stock              | integer | null: false |
| quantity_id        | integer | null: false |
| deadline           | date    | null: false |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :recipe_foods
- has_one_attached :image
- has_many :recipes, through: :recipe_foods

## recipes テーブル
| Column             | Type    | Options     |
| ------------------ | --------| ----------- |
| dish               | string  | null: false |
| process            | text    | null: false |
### Association
- has_many :recipe_foods
- has_many :foods, through: :recipe_foods
- has_many :diaries

## diaries テーブル
| Column             | Type    | Options     |
| ------------------ | --------| ----------- |
| day                | date    | null: false |
| dish               | string  | null: false |
| recipe             | references  | null: false, foreign_key: true|
| user               | references  | null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :diary

## recipe_foods テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| recipe             | references | null: false, foreign_key: true |
| food               | references | null: false, foreign_key: true |
### Association
- belongs_to :recipe
- belongs_to :food
# アプリケーション名
MMM（meal management）

# アプリケーション概要
冷蔵庫の在庫を管理とレシピ検索や料理記録ができる。

# URL
https://mmm-m1nz.onrender.com

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：
- パスワード：

# 利用方法
## 在庫管理（未実装）
1. トップページの「食材」から「在庫一覧」へ遷移
2. 在庫がカテゴリごとに表示され、画面下部に「追加する」がある。
### 在庫追加（未実装）
1. 「追加する」から新しく食材を登録する画面へ遷移
2. カテゴリ・食材名・数量・単位・賞味期限を入力し登録できる
3. 「在庫一覧」に追加される。
### 在庫編集（未実装）
1. 「在庫一覧」にある在庫をクリックすると編集画面に遷移する。
2. 在庫の数量・単位・賞味期限の編集ができる。
3. 「削除」ボタンがあり削除できる。

## レシピ検索（未実装）
1. トップページの「レシピ」から「レシピ検索」へ遷移
2. 作成可能なレシピが主菜や副菜などカテゴリごとに表示される
3. 「検索」に食材を入れると、その食材を使用したレシピが表示される

## 料理記録（未実装）
1. トップページの「料理記録」からカレンダーへ遷移
2. 1か月分のカレンダーに作成した料理を登録できる。

# アプリケーションを作成した背景
毎日の献立・買い物を考えている時間を短くしたい。

# 実装した機能についての画像やGIFおよびその説明※

# 実装予定の機能
- 在庫管理
- レシピ検索
- 料理記録

# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/94eba4623f035e39e45636b1cfe67a7f.png)](https://gyazo.com/94eba4623f035e39e45636b1cfe67a7f)

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

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/6dce7f32235edf5f883ce3ffa14effa0.png)](https://gyazo.com/6dce7f32235edf5f883ce3ffa14effa0)

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/lemon78787878/mmm.git
% cd mmm
% bundle install
% yam install

# 工夫したポイント
# 改善点
# 制作時間
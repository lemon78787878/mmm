# アプリケーション名
MMM（meal management）

# アプリケーション概要
冷蔵庫の在庫を管理と料理記録、レシピ検索や料理記録ができる。

# URL
https://mmm-m1nz.onrender.com

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：test@test.com
- パスワード：a123456

# 利用方法
## ユーザ管理
1. アプリを開くとログイン画面になる。「ログイン」「新規登録」への遷移ボタンがある。
2. ログイン後トップページへ遷移する。
[![Image from Gyazo](https://i.gyazo.com/ec11b6fa8fa9434cd9c3acbbe18ca311.gif)](https://gyazo.com/ec11b6fa8fa9434cd9c3acbbe18ca311)

## 在庫管理
1. トップページの「食材」から「在庫一覧」へ遷移
2. 在庫がカテゴリごとに表示され、画面下部に「追加する」がある。
[![Image from Gyazo](https://i.gyazo.com/d7a5f50b4c244f07879205c4cc464a6b.gif)](https://gyazo.com/d7a5f50b4c244f07879205c4cc464a6b)
### 在庫追加
1. 「追加する」から新しく食材を登録する画面へ遷移
2. カテゴリ・食材名・数量・単位・賞味期限を入力し登録できる
3. 「在庫一覧」に追加される。
[![Image from Gyazo](https://i.gyazo.com/2b5d484f0ee5aa4fe1d7b583473f9667.gif)](https://gyazo.com/2b5d484f0ee5aa4fe1d7b583473f9667)
### 在庫編集
1. 「在庫一覧」にある在庫をクリックすると編集画面に遷移する。
2. 在庫の数量・単位・賞味期限の編集ができる。
3. 「削除」ボタンがあり削除できる。

## レシピ検索（未実装）
1. トップページの「レシピ」から「レシピ検索」へ遷移
2. 作成可能なレシピが主菜や副菜などカテゴリごとに表示される
3. 「検索」に食材を入れると、その食材を使用したレシピが表示される

## 料理記録
1. トップページの「料理記録」からカレンダーへ遷移
2. 1か月分のカレンダーに作成した料理を登録できる。
3. 日付を押すとその日の料理記録が確認できる。
### 料理記録編集
1. 日付を押すとその日の料理記録が確認でき、「編集」・「削除」ボタンがある。
2. 料理記録の料理名・日付の編集ができる。
3. 「削除」ボタンがあり削除できる。

# アプリケーションを作成した背景
毎日の献立・買い物を考えている時間を短くしたい。

# 実装した機能についての画像やGIFおよびその説明※

# 実装予定の機能
- レシピ検索
- 編集・削除前に警告文を発するようにする。
- 料理記録に作成した料理の写真が載せられるようにする


# テーブル設計
[![Image from Gyazo](https://i.gyazo.com/02a8a2419720017ab3d6a962d6ded648.png)](https://gyazo.com/02a8a2419720017ab3d6a962d6ded648)

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association
- has_many :diaries


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
- has_one_attached :image
- has_many :recipe_foods（追加予定）
- has_many :recipes, through: :recipe_foods（追加予定）

## recipes テーブル（追加予定）
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
| diary_day          | date    | null: false |
| dish               | string  | null: false |
| recipe（追加予定）  | references  | null: false, foreign_key: true|
| user               | references  | null: false, foreign_key: true|
### Association
- belongs_to :user

## recipe_foods テーブル（追加予定）
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| recipe             | references | null: false, foreign_key: true |
| food               | references | null: false, foreign_key: true |
### Association
- belongs_to :recipe
- belongs_to :food

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/205b77e2dd8c844c952487530fa2a827.png)](https://gyazo.com/205b77e2dd8c844c952487530fa2a827)

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行
- % git clone https://github.com/lemon78787878/mmm.git
- % cd mmm
- % bundle install
- % yam install

# 工夫したポイント
- 在庫管理時にカテゴリーごとに保存がされるようにすること。
- 写真を使用した表示方法や色遣いに気を付けてHTML・CSSを装飾したこと。
- Javascriptを使用して、非同期通信で出来る処理は非同期通信処理を行い、ページ遷移を極力少なくした。

# 改善点
- もう少し見やすくHTML・CSSを設定することができた
- AIの実装には時間がかかりそう。キャッシュの問題かもしれない。


# 制作時間
- 1週間程度
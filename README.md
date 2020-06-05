#  アプリ名
  ワーキングホリデー相談掲示板

## このアプリの説明
- ワーキングホリデーを行う方を対象とした、相談や、ワーキングホリデー体験を投稿できるアプリケーションになり、以下の機能を実装していく予定です。
### ユーザー機能
- 新規登録, ログイン(見ログインでもサイトは閲覧可能、投稿はできない), ログアウト機能, 編集機能, 削除機能

### ワーキングホリデー体験投稿機能
- ログイン後、ワーキングホリデー体験を投稿可能

### 相談機能(2パターン)
- ①特定の人のプロフィールに直接メッセージを送り相談。(相談投稿者及び受信者以外の他者の閲覧不可)
- ②公共の相談コーナーを作成し、そこから返信を広く募集する。(サイト利用者全員が閲覧可能)

### 通知機能(2パターン用)
- ①ダイレクトメッセージで相談された場合、メッセージの受信時には、通知させる。
- ②公共のコーナーに相談メッセージが投稿された場合には、同じ国に留学したい人、同じ国への留学経験者に通知させる。

# 開発環境
|言語|バージョン|
|----|----------|
|Ruby on Rails|Rails 6.0.2.2|
|Ruby|ruby 2.5.7|
|Vue.js|Vue.js 2.6.1|
|HTML|Haml記法|
|CSS|SCSS記法|

## データベース
- 開発環境は、mysql2を使用

# DB設計

## countriesテーブル
|Column|Type|Options|
|------|----|-------|
|country|string|null: false|

### Association
- has_many :users
- has_many :articles
- has_many :public_consultations


## situationsテーブル
|Column|Type|Options|
|------|----|-------|
|situation|string|null: false|

### Association
- has_many :users
- has_many :articles


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|age_id|integer|null: false|
|profession_id|integer|null: false|
|gender_id|integer|null: false|
|password|string|null: false|
|profile|text|null: false|
|situation_id|references|null: false, foreign_key: true|
|country_id|references|null: false, foreign_key: true|
|experience_country_id|references|foreign_key: { to_table: countries}|
|duration|string|null: false|

### Association
- belongs_to :country
- belongs_to :situation
- has_many :articles
- has_many :public_consultations
- has_many :public_consultation_comments
- has_many :direct_consultations
- has_many :direct_consultation_comments
- has_many :user_notifications


## articlesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|references|null: false, foreign_key: true|
|purpose|string|null: false|
|content|text|null: false|
|city|string|null: false|
|situation_id|references|null: false, foreign_key: true|
|free_description|text|null: false|

### Association
- belongs_to :user
- belongs_to :situation
- belongs_to :country


## article_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|article_id|references|foreign_key: true|

### Association
- belongs_to :article


## public_consultationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|country_id|references|null: false, foreign_key: true|
|title|string|null: false|
|content|text|null: false|

### Association
- belongs_to :country
- belongs_to :user
- has_many :public_consultation_comments
- has_many :user_notifications


## public_consultation_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|public_consultation_id|references|null: false, foreign_key: true|
|title|string|null: false|
|content|text|null: false|

### Association
- belongs_to :user
- belongs_to :public_consultation
- has_many :user_notifications


## direct_consultationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|advice_user_id|references|null: false, foreign_key: { to_table: :users}|
|title|string|null: false|
|content|text|null: false|

### Association
- belongs_to :user
- has_many :direct_consultation_comments
- has_many :user_notifications


## direct_consultation_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|direct_consultation_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|title|string|null: false|
|content|text|null: false|

### Association
- belongs_to :user
- belongs_to :direct_consultation
- has_many :user_notifications


## user_notificationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|is_read|integer|null: false, default: 0|
|public_consultation_id|references||
|public_consultation_comment_id|references||
|direct_consultation_id|references||
|direct_consultation_comment_id|references||

### Association
- belongs_to :user
- belongs_to :public_consultation
- belongs_to :public_comsultation_comment
- belongs_to :direct_consultation
- belongs_to :direct_consultation_comment
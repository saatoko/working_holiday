# DB設計

## countriesテーブル
|Column|Type|Options|
|------|----|-------|
|country|string|null: false|

### Association
- has_many :users
- has_many :situations
- has_many :articles
- has_many :public_consultations


## situationsテーブル
|Column|Type|Options|
|------|----|-------|
|situation|string|null: false|
|country_id|references|null: false, foreign_key: true|

### Association
- has_many :users
- has_many :articles
- belongs_to :country


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
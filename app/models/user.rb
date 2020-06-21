class User < ApplicationRecord
  has_secure_password

  belongs_to :country,                      optional: true
  belongs_to :situation,                    optional: true
  has_many   :public_consultations
  has_many   :public_consultation_comments
  has_many   :direct_consultations
  has_many   :direct_consultation_comments
  has_many   :user_notifications
  has_many   :articles

  # ２つの連続したドットはマッチさせないようにする
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :nickname, with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々]|[-]?[0-9]+(\.[0-9]+)?|[a-zA-Z])+\z/

  validates :nickname,           presence: true, length: { in: 6..20 }
  validates :email,              presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password_digest,    presence: true

  validates :age_id,                             numericality: { only_integer: true }, allow_nil: true  
  validates :profession_id,                      numericality: { only_integer: true }, allow_nil: true  
  validates :gender_id,                          numericality: { only_integer: true }, allow_nil: true  
  validates :situation,                          numericality: { only_integer: true }, allow_nil: true  
  validates :country,                            numericality: { only_integer: true }, allow_nil: true  
  validates :experience_country,                 numericality: { only_integer: true }, allow_nil: true  
  # validates :duration
  # validates :profile
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :age
  belongs_to_active_hash :gender
  belongs_to_active_hash :profession
end

class User < ApplicationRecord
  belongs_to :country
  belongs_to :situation
  has_many   :public_consultations
  has_many   :public_consultation_comments
  has_many   :direct_consultations
  has_many   :direct_consultation_comments
  has_many   :user_notifications
  has_many   :articles


  validates :nickname,           presence: true, uniqueness: true, length: { in: 6..20 }
  validates :email,              presence: true, uniqueness: true
  validates :password_digest,    presence: true
  validates :age_id,                             numericality: { only_integer: true }, allow_nil: true
  validates :profession_id,                      numericality: { only_integer: true }, allow_nil: true
  validates :gender_id,                          numericality: { only_integer: true }, allow_nil: true
  validates :profile
  validates :situation,                          numericality: { only_integer: true }, allow_nil: true
  validates :country,                            numericality: { only_integer: true }, allow_nil: true
  validates :experience_country,                 numericality: { only_integer: true }, allow_nil: true
  validates :duration
  
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :age
  belongs_to_active_hash :gender
  belongs_to_active_hash :profession
end

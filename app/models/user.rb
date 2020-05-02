class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :country
  belongs_to :situation
  has_many   :public_consultations
  has_many   :public_consultation_comments
  has_many   :direct_consultations
  has_many   :direct_consultation_comments
  has_many   :user_notifications
  has_many   :articles

  validates :nickname,           presence: true, uniqueness: true
  validates :age_id,             presence: true
  validates :profession_id,      presence: true
  validates :gender_id,          presence: true
  validates :password,           presence: true
  validates :profile,            presence: true
  validates :situation,          presence: true
  validates :country,            presence: true
  validates :experience_country, presence: true
  validates :duration,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :age
  belongs_to_active_hash :gender
  belongs_to_active_hash :profession
end

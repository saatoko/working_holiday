class PublicConsultation < ApplicationRecord
  has_many   :public_consultation_comments
  has_many   :user_notification
  belongs_to :user
  belongs_to :country

  validates :user,    presence: true
  validates :country, presence: true
  validates :title,   presence: true
  validates :content, presence: true
end

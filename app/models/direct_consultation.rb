class DirectConsultation < ApplicationRecord
  belongs_to :user
  has_many   :direct_consultations
  has_many   :user_notification

  validates :user,        presence: true
  validates :advice_user, presence: true
  validates :title,       presence: true
  validates :content,     presence: true
end

class DirectConsultationComment < ApplicationRecord
  has_many   :user_notification
  belongs_to :user
  belongs_to :direct_consultation

  validates :user,                presence: true
  validates :direct_consultation, presence: true
  validates :title,               presence: true
  validates :content,             presence: true
end

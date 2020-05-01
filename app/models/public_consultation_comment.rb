class PublicConsultationComment < ApplicationRecord
  has_many   :user_notifications
  belongs_to :user 
  belongs_to :public_consultation

  validates :user,                presence: true
  validates :public_consultation, presence: true
  validates :title,               presence: true
  validates :content,             presence: true
end

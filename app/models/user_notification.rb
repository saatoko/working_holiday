class UserNotification < ApplicationRecord
  belongs_to :user
  belongs_to :public_consultation
  belongs_to :public_consultation_comment
  belongs_to :direct_consultation
  belongs_to :direct_consultation_comment

  validates :user,    presence: true
  validates :is_read, presence: true
end

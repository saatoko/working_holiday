class Country < ApplicationRecord
  has_many :users
  has_many :public_consultations
  has_many :articles

  validates :country,  presence: true
end

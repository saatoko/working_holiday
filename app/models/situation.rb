class Situation < ApplicationRecord
  has_many   :users
  belongs_to :country
  has_many   :articles

  validates :situation,  presence: true
  validates :country,    presence: true
end

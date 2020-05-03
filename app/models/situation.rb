class Situation < ApplicationRecord
  has_many   :users
  has_many   :articles

  validates :situation,  presence: true
end

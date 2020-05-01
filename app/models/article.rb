class Article < ApplicationRecord
  belongs_to :user
  belongs_to :situation
  belongs_to :country
  
  has_many                      :article_images, dependent: :destroy
  accepts_nested_attributes_for :article_images, allow_destroy: true

  validates :title,            presence: true
  validates :user,             presence: true
  validates :purpose,          presence: true
  validates :content,          presence: true
  validates :city,             presence: true
  validates :country,          presence: true
  validates :situation,        presence: true
  validates :free_description, presence: true
end

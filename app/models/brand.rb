class Brand < ApplicationRecord
  has_many :items
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.manufacturer_email = manufacturer_email.downcase }
  validates :email, presence: true, length: { maximum: 150 }, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end

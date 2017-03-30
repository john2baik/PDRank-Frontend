class User < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  attr_accessor :remember_token
  before_save {email.downcase!}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive:false}
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  acts_as_follower
  acts_as_followable
  has_many :microposts, dependent: :destroy
  has_many :documents, dependent: :destroy
  mount_uploader :avatar, AvatarUploader #allows for uploading profile images to avatar
  mount_uploader :image, ImageUploader
  mount_uploader :document, DocumentUploader

  def feed
    Micropost.where("user_id = ?", id)
  end
  # Returns the hash digest of the given string.
    def self.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
          BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def self.new_token
      SecureRandom.urlsafe_base64
    end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end

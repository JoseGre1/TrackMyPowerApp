class User < ApplicationRecord
  #Using friendly_id gem for more beautiful user routes
  extend FriendlyId
  friendly_id :username
  has_many :alerts
  has_many :notifications
  #downcasing whole email address before saving it to DB
  before_save { email.downcase! }

  #User's name validation
  validates :name, presence: true, length: { maximum: 50 }

  #REGEX: Regular Expresion for e-mail format validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #User's email validation
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  #Implementing secure password
  has_secure_password
  #User's password validation
  validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

  #REGEX: Regular Expresion for e-mail format validation
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+$\z/i
  #Validate username
  validates :username, presence: true, length: {maximum: 20},
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }

  #ActiveModel associations
  belongs_to :dashboard
  validates :dashboard_id, presence: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

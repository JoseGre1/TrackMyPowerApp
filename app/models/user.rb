class User < ApplicationRecord
  #downcasing whole email address before saving it to DB
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  #REGEX: Regular Expresion for e-mail format validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  #Implementing secure password
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end

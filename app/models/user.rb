class User < ApplicationRecord
  has_many :projects
  before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@(alum.)?mit\.edu/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.search(search)
    search = search.downcase
    where("LOWER(first_name) LIKE ? or LOWER(last_name) LIKE ? or LOWER(skill) LIKE ? or LOWER(about_me) LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    # where("last_name LIKE ?", "%#{search}%")
    # where("skill LIKE ?", "%#{search}%")
    # where("about_me LIKE ?", "%#{search}%")
  end
end

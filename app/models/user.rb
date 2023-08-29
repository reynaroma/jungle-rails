class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence:true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  
  def authenticate(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end

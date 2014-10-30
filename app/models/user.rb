class User < ActiveRecord::Base

  VALID_USERNAME_REGEX = /\A[a-z0-9\-]*\z/i
  belongs_to :role

  validates :username, presence: true, length: { maximum: 20 }, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, :length => {:within => 6..20}
  validates :password_digest, presence: true
  validates_presence_of :role_id
  validates_inclusion_of :role_id, :in => 0..4
  
  before_save do
    self.email = email.downcase
    self.username = username.downcase
  end

  has_secure_password

end


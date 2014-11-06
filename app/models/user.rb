class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_USERNAME_REGEX = /\A[a-z0-9\-]*\z/i
  belongs_to :role

  validates :username, presence: true, length: { maximum: 15 }, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  validates_presence_of :role_id
  validates_inclusion_of :role_id, :in => 0..4
  
  before_save do
    self.email = email.downcase
  end

end


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_USERNAME_REGEX = /\A[a-z0-9\-]*\z/i
  belongs_to :role

  validates_uniqueness_of :email
  
  before_save do
    self.email = email.downcase
  end

end


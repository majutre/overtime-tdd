class User < ApplicationRecord
  has_many :posts
  has_many :audit_logs
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name

  def full_name
    last_name + ", " + first_name
  end
end

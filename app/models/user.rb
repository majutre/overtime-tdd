class User < ApplicationRecord
  has_many :posts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone

  PHONE_REGEX = /\A[1-9]{2}(?:[2-8]|9[1-9])[0-9]{3}[0-9]{4}\z/

  validates_format_of :phone, with: PHONE_REGEX

  validates :phone, length: { is: 11 }

  def full_name
    last_name + ", " + first_name
  end
end

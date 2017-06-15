class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # add unicness for username colum 29-05 #email already have uniqueness

  validates_uniqueness_of :username
  has_many :payments
  has_one :setting
  
end

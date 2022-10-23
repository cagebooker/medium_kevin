class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stories
  has_many :comments
  validates :username, presence: true, uniqueness: true

  # active_storage
  has_one_attached :avatar
end

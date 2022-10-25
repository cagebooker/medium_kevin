class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  # relationships
  has_many :stories
  has_many :comments
  has_many :follows

  # active_storage
  has_one_attached :avatar

  # instance method
  def follow?(user)
    follows.exists?(following: user)
  end
  def follow!(user)
    if follow?(user)
        follows.find_by(following_id: user.id).destroy
        return 'Follow'
    else
        follows.create(following_id: user.id)
        return 'Followed'
    end
  end

end

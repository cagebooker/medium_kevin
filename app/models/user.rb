class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  enum role:{
    user: 0,
    vip_user: 1,
    platinum_user: 2,
    admin: 3
  }
  # relationships
  has_many :stories
  has_many :comments
  has_many :follows
  has_many :bookmarks

  # active_storage
  has_one_attached :avatar

  # instance method
  def paid_user?
    vip_user? or platinum_user?
  end
  def bookmark?(story)
    bookmarks.exists?(story_id: story.id)
  end
  def bookmark!(story)
    if bookmark?(story)
      bookmarks.find_by(story_id: story.id).destroy
      return 'UnBookmarked'
    else
      bookmarks.create(story_id: story.id)
      return 'Bookmarked'
    end
  end

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

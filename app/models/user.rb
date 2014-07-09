class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :bookmarks
  has_many :favorites, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def favorited(bookmark)
    self.favorites.where(bookmark_id: bookmark.id).first
  end
end

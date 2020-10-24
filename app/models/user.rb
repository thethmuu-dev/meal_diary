class User < ApplicationRecord
  has_many :entries
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed
  has_many :follower_users, through: :passive_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
end

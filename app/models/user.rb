class User < ApplicationRecord
  has_many :entries
  has_one :diet_plan
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followed_users, through: :active_relationships, source: :followed
  has_many :follower_users, through: :passive_relationships, source: :follower

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save { self.email = email.downcase }
  validates :username, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, presence: true

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  # User Image Validation
  validates_integrity_of  :image
  validates_processing_of :image

  private
    
  def image_size_validation
    errors[:image] << 'should be less than 500KB' if image.size > 0.5.megabytes
  end
end

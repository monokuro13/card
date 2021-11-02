class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }}

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def posts
    return Post.where(user_id: self.id)
  end
end

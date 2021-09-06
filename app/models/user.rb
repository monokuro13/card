class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def posts
    return Post.where(user_id: self.id)
  end
end

class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  validates :img, {presence: true}
  validates :movie, {presence: true}
  validates :group, {presence: true}
  validates :request, {presence: true}
  validates :give, {presence: true}

 

  def user
    return User.find_by(id: self.user_id)
  end
 
end

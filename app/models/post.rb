class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  validates :img, {presence: true}
  validates :movie, {presence: true}
  validates :album, {presence: true}

  with_options presence: true, format: {without: /\A[ぁ-んァ-ン一-龥]/ , message: 'は英数字で入力してください'} do
   validates :group
  end

  validates :request, {presence: true}
  validates :give, {presence: true}

  has_many :likes, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end

end

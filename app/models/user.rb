class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :books, dependent: :destroy
   attachment :user_image

   validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
   validates :user_caption, length: {maximum: 50}
  #emailを不要とする
  def email_changed?
    false
  end
end

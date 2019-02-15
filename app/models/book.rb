class Book < ApplicationRecord
	belongs_to :user

   validates :title, presence: true, length: {maximum: 50}
   validates :book_caption, presence: true, length: {maximum: 200}
end

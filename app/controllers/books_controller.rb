class BooksController < ApplicationController
	before_action :authenticate_user!,except: [:top,:about]
	before_action :correct_user, only:[:edit,:update]
	def top
	end

	def about
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created"
			redirect_to book_path(@book.id)
		 else
			flash[:notice] = "error:字数制限・空白にご注意ください。"
		 	redirect_to user_path(current_user.id)
		end
		# 	render "books/top"
		# end
	end

	def edit
	end

	def update
		@book.user_id = current_user.id
		if @book.update(book_params)
			flash[:notice] = "Book was successfully updated"
			redirect_to book_path(@book)
		else
			flash[:notice] = "error:字数制限・空白にご注意ください。"
			redirect_to edit_book_path(@book)
		end
	end

	def index
		# 本のタイトル・感想一覧用
		@books = Book.all
		# ユーザーの顔写真一覧用
		@users = User.all
		# テンプレ用
		@book = Book.new
	end

	def show
		# テンプレ用
		@book = Book.new
		# ユーザー投稿済みブック一覧詳細用
		@userbook = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		if @book.destroy
			flash[:notice] = "Book was successfully deleted"
			redirect_to books_path
		else
			redirect_to book_path(@book)
		end
	end
	private

	def correct_user
  		@book = Book.find(params[:id])
  		redirect_to root_path unless @book.user_id == current_user.id
  	end

	def book_params
		params.require(:book).permit(:title,:book_caption)
	end

end

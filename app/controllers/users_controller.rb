class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only:[:edit,:update]
	def index
		# ユーザ一覧表示用
		@users = User.all
		# テンプレnewbook用
		@book = Book.new
	end
	def edit
	end

	def update
		if @user.update(user_params)
			flash[:notice] = "User infomation was successfully updated"
			redirect_to user_path(@user.id)
		else
			flash[:notice] = "error:字数制限・空白にご注意ください。"
			redirect_to edit_user_path(@user)
		end
	end

  def show
  	#テンプレUserinfo用
  	@user = User.find(params[:id])
  	@book = Book.new
  	# 一覧表示用
  	@books = Book.all
  end

  private
  	def correct_user
  		@user = User.find(params[:id])
  		redirect_to root_path unless @user == current_user
  	end

    def user_params
        params.require(:user).permit(:user_image, :name, :user_caption)
    end
end

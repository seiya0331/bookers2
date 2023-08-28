class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    user_id = params[:id]
    login_user_id = current_user.id
    if(user_id != login_user_id)
    redirect_to book_path
    @user = User.find(params[:id])
    end
  end

  def update
    user_id = params[:id]
    login_user_id = current_user.id
    if(user_id != login_user_id)
    redirect_to post_images_path
    end
    @user =  User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to  user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
end

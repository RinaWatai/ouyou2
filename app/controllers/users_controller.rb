class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:root]
  before_action :ensure_correct_user, {only: [:edit]}

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @books = Book.all
    @user = User.find(params[:id])
      if current_user != @user
        redirect_to books_path(@books)
      end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
   user = User.find(params[:id])
   unless user.id == current_user.id
     redirect_to user_path(current_user)
   end
  end
end

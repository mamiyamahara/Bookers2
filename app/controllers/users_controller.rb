class UsersController < ApplicationController
  #ログインしていない状態で他のページに飛んだときログインページに戻る)
  before_action :authenticate_user!
  #(ログインユーザー以外の人がアクセスできないように制限をかける記述)
  before_action :ensure_current_user, {only: [:edit]}

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end


private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

# 正しいユーザかを確かめるという意味のensure_current_userメソッドを用意して、ログイン中のユーザのidと編集したいユーザのidが等しいかを判定する。
# アクセス制限(Ruby on Rails)で検索
  def  ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
    redirect_to user_path(current_user.id)
    else
    render :edit
    end
  end

end


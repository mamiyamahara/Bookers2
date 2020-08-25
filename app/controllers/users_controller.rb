class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
  	@book = Book.new
  	@user = current_user
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  	@user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image_id, :introduction)
  end

end

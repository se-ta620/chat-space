class UsersController < ApplicationController

   # before_action :move_to_index

  def index
    @users = User.where('name Like(?)' , "%#{params[:keyword]}%")
    respond_to do |format|
      format.json
    end
  end

  def edit
    @user = Users.find(params[:id]) if user.id == current_user.id
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    move_to_index
  end

  private
  def user_params
    params.permit(:name, :email)
  end

  def move_to_index
    redirect_to controller: :groups, action: :index
  end
end

class GroupsController < ApplicationController

  def index
    @groups = current_user.groups.order('id desc')
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.save
      redirect_to root_path, notice: "グループを編集しました"
    else
      render :edit
    end
  end

  def destroy

  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end

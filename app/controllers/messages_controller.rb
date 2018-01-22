class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @currentgroup = Group.find(params[:group_id])
    @messages = @currentgroup.messages.includes(:user)
    respond_to do |format|
      format.json
      format.html
    @message = current_user.messages.new
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.json { }
      end
    else
      render :index, notice: "メッセージか画像を入力してください"
    end
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end
end

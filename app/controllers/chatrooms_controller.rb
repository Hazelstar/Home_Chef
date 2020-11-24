class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
    @message = Message.new
    @message.user = current_user
  end

  def new
    @chatroom = Chatroom.new(chatroom_params)
  end

  private
  def chatroom_params
    params.require(:message).permit(:content)
  end
end

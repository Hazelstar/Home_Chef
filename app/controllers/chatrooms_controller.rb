class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.includes(messages: :user).find(params[:id])
    # @chatroom.name = chatroom.where(cooker: :user)

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

  def cooker
    @cooker = User.find(params[:user_id])
  end
end

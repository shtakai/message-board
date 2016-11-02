class MessagesController < ApplicationController
  def index
    @message = Message.new
    
    # grab all messages
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to root_path, notice: 'sent the message'
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
end

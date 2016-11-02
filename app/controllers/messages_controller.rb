class MessagesController < ApplicationController
  def index
    @message = Message.new
    
    # grab all messages
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'created new message'
    else
      # failed to save
      @messages = Message.all
      flash.now[:alert] = "failed saving the message"
      render 'index'
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
end

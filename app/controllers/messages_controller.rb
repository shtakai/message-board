class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy] 
  POSTTYPE = { 
    edit:   '編集', 
    create:  '作成', 
  }

  def index
    @message = Message.new
    
    # grab all messages
    @messages = Message.all
    post_type
  end
  
  def create
    @message = Message.new(message_params)
    post_type(:create)
    if @message.save
      redirect_to root_path, notice: 'created new message'
    else
      # failed to save
      @messages = Message.all
      flash.now[:alert] = "failed saving the message"
      render 'index'
    end
  end
  
  def edit
    post_type(:edit)
  end
  
  def update
    if @message.update(message_params)
      post_type
      # 保存に成功したときはトップページへリダイレト
      redirect_to root_path, notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      post_type(:edit)
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    post_type
    redirect_to root_path, notice: 'メッセージを削除しました'
  end
  
  
  private
  
  def message_params
    params.require(:message).permit(:name, :body, :age)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  def post_type(method = :create)
    @post_type = POSTTYPE[method] || POSTTYPE[:create]
  end
  
end

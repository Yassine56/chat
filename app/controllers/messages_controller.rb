class MessagesController < ApplicationController
  before_action :authenticate_user!
  enable_sync only: [:create]

  def new
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end

  def up
    message = Mailboxer::Message.find(params[:id])
    message.liked_by current_user

    redirect_to conversation_path(message.conversation.id)
  end

  def down
    message = Mailboxer::Message.find(params[:id])
    message.disliked_by current_user

    redirect_to conversation_path(message.conversation.id)
  end
end
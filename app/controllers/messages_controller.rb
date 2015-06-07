class MessagesController < ApplicationController

	before_action :authorized?

	def index
		@messages = get_user_message if current_user
		@message_count = @messages.count
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)
 		#captures user_id when creating message		
 		@message.user_id = current_user.id if current_user 

		if @message.save
			redirect_to @message
		else
			flash.now[:error] = @message.errors.full_messages
  			render "new"
		end
	end	

	def show
		@message = Message.find(params[:id])
		redirect_to public_path unless @message.user == current_user
	end

	def edit
		@message = Message.find(params[:id])
		redirect_to public_path unless @message.user == current_user
	end

	def update
		@message = Message.find(params[:id])

		if @message.update(message_params)
			redirect_to @message
		else
			flash.now[:error] = @message.errors.full_messages
			render "edit"
		end
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
	 
		redirect_to messages_path
	end


private

	def message_params
		params.require(:message).permit(:to_name, :msg, :is_public, :user_id)
	end

	def get_user_message
		 Message.where(user_id: current_user.id)
	end


end

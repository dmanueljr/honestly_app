class AddressesController < ApplicationController
  
  before_action :authorized?

  def index

  	@addresses = get_message.addresses.all
    @address_count = @addresses.count

  end



  def new

  	@address = get_message.addresses.build
  
  end



  def create
    @address = get_message.addresses.build(address_params)
  	
    #captures message_id when adding address
    # @address.message = Message.find(params[:id])
  	
  	if @address.save
      redirect_to message_addresses_path
  	else
      flash.now[:error] = @address.errors.full_messages
      render "new"
    end

  end



  def show

  	@address = get_message.addresses.find(params[:id])

    if @address.message.user_id != current_user.id
      redirect_to messages_path
    end

  end



  def edit

  	@address = get_message.addresses.find(params[:id])

    if @address.message.user_id != current_user.id
      redirect_to messages_path
    end

  end



  def update

  	@address = get_message.addresses.find(params[:id])

  	if @address.update(address_params)
  		redirect_to message_address_path
  	else
  		render "edit"
  	end
  
  end



  def destroy

  	@address = get_message.addresses.find(params[:id])
  	@address.destroy
  	redirect_to message_addresses_path

  end



private

	def address_params
		params.require(:address).permit(:address_1, :address_2, :city, :state, :zip_code)
	end

  def get_message
    @message = Message.find(params[:message_id])
  end

end

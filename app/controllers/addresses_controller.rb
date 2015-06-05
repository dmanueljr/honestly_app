class AddressesController < ApplicationController
  


  def index

  	@addresses = get_message.addresses.all
    
    #user prompt for multiple address destinations
    @to_address = "this card to this address: "

    if @addresses.count > 1
      @to_address = "a card to each of the following addresses: "
    end

  end



  def new

  	@address = get_message.addresses.build
  
  end



  def create
    @address = get_message.addresses.build(address_params)
  	
    #captures message_id when adding address
    # @address.message = Message.find(params[:id])
  	
  	if @address.save
      redirect_to @address.message
  	else
      render "new"
    end

  end



  def show

  	@address = get_message.addresses.find(params[:id])

  end



  def edit

  	@address = get_message.addresses.find(params[:id])
 
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

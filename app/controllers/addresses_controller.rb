class AddressesController < ApplicationController
  


  def index

  	@addresses = Address.all
    
    #user prompt for multiple address destinations
    @to_address = "this card to this address: "
    if @addresses.count > 1
      @to_address = "a card to each of the following addresses: "
    end

  end



  def new

  	@address = Address.new
  
  end



  def create
    @address = Address.new(address_params)
  	
    #captures message_id when adding address
    @address.message = Message.find(params[:id])
  	
  	if @address.save
      redirect_to @address.message
  	else
      render "new"
    end

  end



  def show

  	@address = Address.find(params[:id])

  end



  def edit

  	@address = Address.find(params[:id])
 
  end



  def update

  	@address = Address.find(params[:id])

  	if @address.update(address_params)
  		redirect_to @address
  	else
  		render "edit"
  	end
  
  end



  def destroy

  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to addresses_path

  end



private

	def address_params
		params.require(:address).permit(:address_1, :address_2, :city, :state, :zip_code)
	end



end

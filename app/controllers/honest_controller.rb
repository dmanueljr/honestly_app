class HonestController < ApplicationController
  
  def index
  end

  def public
  	@messages = Message.all
  end

end

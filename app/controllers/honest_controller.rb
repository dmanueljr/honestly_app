class HonestController < ApplicationController
  
  def index
  end

  def how
  end

  def public
  	@messages = Message.all
  end

  def contact
  end

end

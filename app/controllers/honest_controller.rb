class HonestController < ApplicationController
  
  def index
  end

  def how
  end

  def public
  	@messages = Message.where(is_public: true)
  end

  def contact
  end

end

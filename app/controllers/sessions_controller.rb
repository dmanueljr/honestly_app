class SessionsController < ApplicationController
	
	def new
		redirect_to messages_path if current_user
	end

	def show
	end

	def create
	
		user = User.find_by(email: params[:login][:email])

		if user && user.authenticate(params[:login][:password])
			#log them in (set a cookie)
			session[:user_id] = user.id.to_s
			redirect_to messages_path
		else
			render :new
		end
	end

	def destroy
		if session['auth']
	    	session['auth'] = nil
	    else
	    	session.delete(:user_id)
	    end
	    redirect_to sign_in_path
	end
end

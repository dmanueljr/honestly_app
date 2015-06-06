class SessionsController < ApplicationController
	
	def new
	end

	def show
	    redirect_to root_path unless session['auth']
	    @auth = session['auth']
	end

	def create
	
		user = User.find_by(email: params[:login][:email])

		if user && user.authenticate(params[:login][:password])
			#log them in (set a cookie)
			session[:user_id] = user.id.to_s
			redirect_to user_path(user)
		else
			render :new
		end

	    # @auth = request.env['omniauth.auth']
	    # session['auth'] = @auth
	    # redirect_to sessions_show_path
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

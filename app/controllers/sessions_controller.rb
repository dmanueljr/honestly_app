# class SessionsController < ApplicationController
#   def new
#   end

#   def create
# 	user = User.find_by(email: params[:login][:email])

# 	if user && user.authenticate(params[:login][:password])
# 		#log them in (set a cookie)
# 		session[:user_id] = user.id.to_s
# 		redirect_to users_path
# 	else
# 		render :new
# 	end
#   end

#   def destroy
# 		session.delete(:user_id)
# 		redirect_to login_path
#   end
# end


class SessionsController < ApplicationController
	
	def new
	end

	def show
	    redirect_to root_path unless session['auth']
	    @auth = session['auth']
	end

	def create
	    @auth = request.env['omniauth.auth']
	    session['auth'] = @auth
	    redirect_to sessions_show_path
	end

	def destroy
	    session['auth'] = nil
	    redirect_to root_path
	end
end

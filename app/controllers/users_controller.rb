class UsersController < ApplicationController
  
  before_action :authorized?, except: [:new, :create]

  def index
  	@users = User.all
    redirect_to messages_path unless current_user.id == 1
  end

  def new
  	@user = User.new
    redirect_to messages_path if current_user
  end

  def create
	@user = User.new(user_params)
  	if @user.save
      flash[:notice] = "Thank you for signing up!"
      session[:user_id] = @user.id.to_s
  		redirect_to @user
  	else
      flash.now[:error] = @user.errors.full_messages
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end

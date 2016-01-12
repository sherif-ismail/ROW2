class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      @user.send_activation_email 
      #flash[:info] = @user
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
	   else
      flash[:danger] = "Something went wrong, please try again later"
		  render 'new'
	   end
end

private

	def user_params
		params.require(:user).permit(:name, :email, :password,
			:password_confirmation,:driving,:License)
	end


end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if false && @user.save 
      log_in @user
  		flash[:success] = "Welcome to Rules on Wheels, We hope you learn while having fun!"
      redirect_to @user
	   else
      flash[:danger] = "Something went wrong, please try again later"
		  render 'new'
	   end
end

private

	def user_params
		params.require(:user).permit(:name, :email, :password,
			:password_confirmation)
	end


end

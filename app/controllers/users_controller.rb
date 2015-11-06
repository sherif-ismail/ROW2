class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    #return
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to Rules on Wheels, We hope you learn while having fun!"
      redirect_to @user
	   else
		  render 'new'
	   end
end

private

	def user_params
		params.require(:user).permit(:name, :email, :password,
			:password_confirmation)
	end


end

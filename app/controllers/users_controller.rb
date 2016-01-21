class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
    @user.activated = true
  	if @user.save
      #@user.send_activation_email 
      #flash[:info] = "Please check your email to activate your account."
      log_in @user
      redirect_to root_url
	   else
      flash[:danger] = "Something went wrong, please try again later"
		  render 'new'
	   end
  end

  def highscores
    @users = User.all
    @users = @users.sort_by{|e| -e[:score]}
  end

  def update
    @user = current_user
    @user.score = params[:score]
    if @user.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

private

	def user_params
		params.require(:user).permit(:name, :age, :email, :password,
			:password_confirmation,:gameteam,:driving,:license,:score)
	end


end

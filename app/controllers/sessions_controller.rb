class SessionsController < ApplicationController
def new
end

def create
	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        redirect_to user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
	else
		flash[:danger] = 'Invalid email/password combination' # Not quite right!
		# Create an error message.
		render 'new'
	end
end

def destroy
	log_out
    redirect_to root_url
end
end

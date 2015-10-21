class TrafficController < ApplicationController

  def index
  end

  def game
  	unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @questions = get_all_questions
  end


end

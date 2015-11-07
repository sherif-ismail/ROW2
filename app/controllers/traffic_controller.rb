class TrafficController < ApplicationController

  def index
    if(logged_in?)
      redirect_to current_user
    end
  end

  def game
  	unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    allQuestions = get_all_questions
    @categories = Array.new
    @answers = Array.new
    @questions = Array.new
    for q in allQuestions
    	@answers << q.choice1
      @categories << q.category
      @questions << q.body
    end
  end


end

class TrafficController < ApplicationController

  def index
  end

  def game
  	unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    @questions = get_all_questions
    category = Array.new
    for q in @questions
    	if(q.category == 'Signs')
    		category << q.choice1
    	end
    end
    @signsAnswers = category
  end


end

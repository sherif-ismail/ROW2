class QuizzesController < ApplicationController
  def index
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def create
      @quiz = Quiz.new(quiz_params)
      @quiz.user = current_user
    if @quiz.save
      flash[:info] = "Submitted, Thank you for your time :)"
      redirect_to root_url
     else
      flash[:danger] = "Something went wrong, please try again later"
      render 'knowledge'
     end
  end

  def knowledge
    @quiz = Quiz.new
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
    allQuestions = get_all_questions
    @categories = Array.new
    @answers = Array.new
    @questions = Array.new
    @images = Array.new
    @choice2 = Array.new
    @choice3 = Array.new
    @choice4 = Array.new
    for q in allQuestions
      if(q.id >= 491 && q.id <= 500)
      @answers << q.choice1
      @choice2 << q.choice2
      @choice3 << q.choice3
      @choice4 << q.choice4
      @categories << q.category
      @questions << q.body
      @images << q.path
      end
    end
  end

  def flow
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:result, :points, :knowledge,
                                 :flow)
  end
end

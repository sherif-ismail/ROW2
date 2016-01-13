class QuestionsController < ApplicationController

  def index
  end

  def importData
  	if(is_admin?)
  		Question.import(params[:file])
  		flash[:success] = 'Done!' # Not quite right!
  	else
  		flash[:danger] = 'You are not authorized to perform this action!'
  	end
  	redirect_to current_user
  end

  def deleteData
    if(is_admin?)
      Question.delete_all
      flash[:success] = 'Done!' # Not quite right!
    else
      flash[:danger] = 'You are not authorized to perform this action!'
    end
    redirect_to current_user
  end
end

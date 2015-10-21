module QuestionsHelper

def	get_all_questions
	@questions = Question.all
end
end

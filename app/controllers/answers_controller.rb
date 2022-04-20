class AnswersController < ApplicationController
    def create
        @questions = Question.find(params[:question_id])
        @answers = @questions.answers.create(comment_params)
        redirect_to question_path(@questions)
    end
end
    

private
        def comment_params
          params.require(:answer).permit(:body)
        end
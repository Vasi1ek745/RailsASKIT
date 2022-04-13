class QuestionsController < ApplicationController
  def index
    @questions  = Question.all
  end

  def show
    @questions = Question.find(params[:id])
  end

  def new
    @questions = Question.new
  end
  
  def create
    @questions = Question.new question_params
    if @questions.save
      redirect_to questions_path
    else
      render :new      
    end

  end

  def edit
    @questions = Question.find(params[:id])
  end
  
  def update
    @questions = Question.find(params[:id])
    if @questions.update question_params
      redirect_to questions_path
    else
      render :edit      
    end
  end

  def destroy
    @questions = Question.find(params[:id])
    @questions.destroy

    redirect_to questions_path
  end
end

private
  def question_params
    params.require(:question).permit(:title,:body)
  end

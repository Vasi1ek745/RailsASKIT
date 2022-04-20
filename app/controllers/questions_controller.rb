class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]
  
  def index
    @questions  = Question.all
  end

  def show
    
    
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
    
  end
  
  def update
    
    if @questions.update question_params
      redirect_to questions_path
    else
      render :edit      
    end
  end

  def destroy
      @questions.destroy

    redirect_to questions_path
  end
end

private
  def question_params
    params.require(:question).permit(:title,:body)
  end

  def set_question
    @questions = Question.find(params[:id])
  end
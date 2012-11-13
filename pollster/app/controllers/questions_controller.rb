class QuestionsController < ApplicationController

  before_filter :find_poll, only: [:new, :create, :edit, :update, :destroy]
  before_filter :new_question, only: [:new, :create]
  before_filter :find_question, only: [:edit,:destroy]

  def create
    if @question.save
      redirect_to @poll
    else
      flash[:notice] = "Question was not created. Try again"
      redirect_to 'new'
    end
  end

  def new
  end

  def edit
  end

  def destroy
    if @question.destroy
      flash[:notice] = "#{@question.name} has been removed"
      redirect_to @poll
    else
      flash[:notice] = "Delete unsuccessful. Try again"
      redirect_to 'edit'
    end
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to @poll
  end

private

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end

  def new_question
    @question = @poll.questions.new(params[:question])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

end

class QuestionsController < ApplicationController

  before_filter :find_poll, only: [:create]

  def create
    @question = @poll.questions.new(params[:question])
    if @question.save
      redirect_to @poll
    else
      flash[:notice] = "Question was not created. Try again"
      redirect_to 'new'
    end
  end

private

  def find_poll
    @poll = Poll.find(params[:poll_id])
  end

end

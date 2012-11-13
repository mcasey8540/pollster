class ResponsesController < ApplicationController
  def create

    @question = Question.find(params[:question_id])
    @response = @question.responses.new(params[:response])

    if @response.save
      redirect_to @question.poll
    else
      render 'polls/show'
    end
  end
end
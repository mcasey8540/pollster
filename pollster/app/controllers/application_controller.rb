class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_response_for

  private
  def current_response_for(question)
    # current_user.response_for(question)
    question.responses.first || question.responses.new
  end

  def current_user
    # stuff...
  end
end

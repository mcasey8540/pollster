class Response < ActiveRecord::Base
  attr_accessible :poll_id, :question_id, :response, :question

  belongs_to :question
end

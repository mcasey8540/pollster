class Response < ActiveRecord::Base
  attr_accessible :poll_id, :question_id, :response, :question

  validates :response, presence: true, length: { minimum: 5 }

  belongs_to :question
end

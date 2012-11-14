class Question < ActiveRecord::Base
  attr_accessible :name, :poll_id, :response
  belongs_to :poll
  has_many :responses

  accepts_nested_attributes_for :responses

  def response
    ""
  end

  def response=(response_params)
    response = responses.new(response_params)
    response.poll = poll
    response.save
  end
end

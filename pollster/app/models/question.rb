class Question < ActiveRecord::Base
  attr_accessible :name, :poll_id
  belongs_to :poll
  has_many :responses
end

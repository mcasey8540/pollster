class Poll < ActiveRecord::Base
  attr_accessible :name, :url

  validates :name, presence: true, length: { minimum: 10 }

  has_many :questions
  has_many :responses, through: :questions

end

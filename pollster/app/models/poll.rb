class Poll < ActiveRecord::Base
  attr_accessible :name, :url, :questions_attributes

  validates :name, presence: true, length: { minimum: 10 }

  has_many :questions
  has_many :responses, through: :questions
  accepts_nested_attributes_for :questions
end

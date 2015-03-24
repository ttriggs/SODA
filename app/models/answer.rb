class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  validates :title, length: {minimum: 40}
  validates :description, length: {minimum: 150}
  validates :question, presence: true

end

class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  validates :title, length: { minimum: 20 }
  validates :body, length: { minimum: 30 }
  validates :question, presence: true

  class << self
    def featured
      where(featured: true)
    end
  end
end

class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  validates :title, length: { minimum: 40 }
  validates :body, length: { minimum: 50 }
  validates :question, presence: true

  class << self
    def featured
      where(featured: true)
    end
  end

end

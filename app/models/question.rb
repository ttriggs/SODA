class Question < ActiveRecord::Base
  belongs_to :user
  has_many   :answers, dependent: :destroy

  validates :title, length: {minimum: 40}
  validates :description, length: {minimum: 50}
  validates :user, presence: true

end

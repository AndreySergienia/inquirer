class Question < ActiveRecord::Base
  belongs_to :vote
  validates :text, presence: true
end

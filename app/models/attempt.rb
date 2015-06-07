class Attempt < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote
  validates :result, presence: true
end

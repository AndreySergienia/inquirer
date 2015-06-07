class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true, :limit => 4
  belongs_to :vote
  validates :text, presence: true
end

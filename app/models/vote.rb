class Vote < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions,
                                :reject_if => proc { |a| a[:answers_attributes].nil? },
                                :allow_destroy => true
  belongs_to :user
  validates :name, presence: true

  def total_points
    questions.flat_map(&:correct_answers).count
  end
end

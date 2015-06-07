class Vote < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :user
  validates :name, presence: true
end

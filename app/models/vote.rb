class Vote < ActiveRecord::Base
  validates :name, presence: true
end

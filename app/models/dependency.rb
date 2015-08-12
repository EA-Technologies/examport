class Dependency < ActiveRecord::Base
  belongs_to :question
  belongs_to :question_group
  has_many :dependency_conditions, dependent: :destroy
end

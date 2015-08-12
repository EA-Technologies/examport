class DependencyCondition < ActiveRecord::Base
  belongs_to :answer
  belongs_to :dependency
  belongs_to :dependent_question, foreign_key: :question_id, class_name: :question
  belongs_to :question
end

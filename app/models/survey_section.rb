class SurveySection < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :survey

  # Scopes
  default_scope { order ("display_order ASC") }

  named_scope :with_includes, { include: {questions: [:answers, :question_group, {dependency: :dependency_conditions}]}}
end


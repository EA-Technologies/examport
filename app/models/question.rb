class Question < ActiveRecord::Base
  belongs_to :survey_section
  belongs_to :question_group, dependent: :destroy
  has_many :answers, dependent: :destroy # it might not always have answers
  has_one :dependency, dependent: :destroy

  # Scopes
  default_scope { order ("display_order ASC") }


  def correct_answer
    answers.where(is_correct: true).first
  end
end
class Response < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  belongs_to :response_set
  belongs_to :question
  belongs_to :answer


  def correct_answer
    question.correct_answer if question.present?
  end
end

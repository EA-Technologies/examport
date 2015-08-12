class ResponseSet < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses, allow_destroy: true



  def correct_answers
    answers = []
    responses.each do |response|
      if response.question && response.answer == response.question.correct_answer
        answers << response.answer
      end
    end
    answers
  end

  def correct_answers_count
    correct_answers.size
  end

  def result
    (correct_answers_count >= 4) ? "Pass" : "Fail"
  end
end
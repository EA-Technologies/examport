class ResponseSet < ActiveRecord::Base
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
    (marks_received >= passing_marks) ? "Pass" : "Fail"
  end

  def marks_received
    (correct_answers_count * mark_per_question)
  end

  def passing_marks
    setting = Setting.where(name: "passing_marks").first
    setting.value.to_i
  end

  def mark_per_question
    setting = Setting.where(name: "mark_per_question").first
    setting.value.to_i
  end

end
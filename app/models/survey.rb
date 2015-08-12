class Survey < ActiveRecord::Base
  has_many :sections, class_name: "SurveySection", dependent: :destroy
  has_many :sections_with_questions, class_name: "SurveySection"
  has_many :response_sets
end

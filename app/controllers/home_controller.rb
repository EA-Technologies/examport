class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@survey = current_user.surveys.create!(title: "Examination_#{current_user.id}_#{rand(1..100)}")
  	@response_set = @survey.response_sets.build(user: current_user)
  	@questions = []
  	Question.where(pick: 'one').shuffle.each do |question|
  		@questions.push(question) if !@questions.include?(question) && !(@questions.size == 10)
  	end
  end

  def show
  end
end

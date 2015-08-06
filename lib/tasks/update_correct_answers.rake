namespace :exam_portal do

	desc "Insert questions in database"
  task :insert_questions => :environment do
  	# To do
  end

  desc "Update correct answers for a questions"
  task :update_correct_answers => :environment do
  	questions = Question.where(pick: 'one')
  	questions.each do |question|
  		correct_answer = question.answers.where(is_correct: true)
  		unless correct_answer.present?
  			question.answers.shuffle.first.update_attributes({is_correct: true})
  		else
  			puts "#{correct_answer.count} correct answer found."
  		end
  	end
  end
end
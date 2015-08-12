namespace :exam_portal do

	desc "Insert questions in database"
  task :insert_questions => :environment do
  	Question.delete_all
    ResponseSet.delete_all
  	Answer.delete_all
  	question_array = {
											"Who is the current president of USA?"=> [['Bill Cinton', 'Obamma', 'George Bush', 'Joe'], "Obamma"],
											"How many stars in USA flag?" => [['30', '40', '50', '60'], '50'],
								  		"Who is the current prime minister of malaysia?" => [['Najib Razak','Mahathir Mohamad','Abdul Razak Hussein','Tunku Abdul Rahman'], 'Najib Razak'],
								  		"Which country occupied Malaysia during World War II?" => [["Japan", "China", "Australia", "Vietnam"], "Japan"],
								  		"Which is the capital of Malaysia?" => [['Kelang', 'Ambon', 'Kuala Lumpur', 'Dili'], 'Kuala Lumpur'],
								  		"To which religion did Parameshwara Dewa Shah, the ruler of Malacca in the 15th century, convert?" =>  [['Buddhism', 'Jainism', 'Islam', 'Voodooism'], 'Islam'],
								  		"Which country began a programme of confrontation against Malaysia in 1963 that ended in 1966?" => [['UK', 'Thailand', 'Indonesia', 'Burma'], 'Indonesia'],
								  		"Grand Central Terminal, Park Avenue, New York is the world's" => [['largest railway station', 'highest railway station', 'longest railway station', 'None of the above'], 'largest railway station'],
								  		"Entomology is the science that studies" => [['Behavior of human beings', 'Insects', 'The origin and history of technical and scientific terms', 'The formation of rocks'], 'Insects'],
								  		"Eritrea, which became the 182nd member of the UN in 1993, is in the continent of" => [['Asia', 'Europe', 'Africa', 'Australia'], 'Africa'],
								  		"Epsom (England) is the place associated with" => [['Horse racing', 'Shooting', 'Polo', 'Snooker'], 'Horse racing'],
								  		"First human heart transplant operation conducted by Dr. Christian Bernard on Louis Washkansky, was conducted in" => [['1967', '1958', '1968', '1922'], '1967'],
									  	"Galileo was an Italian astronomer who" => [['developed the telescope', 'discovered four satellites of Jupiter', 'discovered that the movement of pendulum produces a regular time measurement', 'All of the above'], 'All of the above'],
									  	"Exposure to sunlight helps a person improve his health because" => [['the infrared light kills bacteria in the body', 'resistance power increases', 'the pigment cells in the skin get stimulated and produce a healthy tan', 'the ultraviolet rays convert skin oil into Vitamin D'], 'the ultraviolet rays convert skin oil into Vitamin D'],
									  	"Guarantee to an exporter that the importer of his goods will pay immediately for the goods ordered by him, is known as" => [["Letter of Credit (L/C)", 'laissezfaire', 'inflation', 'None of the above'], "Letter of Credit (L/C)"],
									  	"Gulf cooperation council was originally formed by" =>  [['Bahrain, Kuwait, Oman, Qatar, Saudi Arabia and United Arab Emirates', 'Second World Nations', 'Third World Nations', 'Fourth World Nations'], 'Bahrain, Kuwait, Oman, Qatar, Saudi Arabia and United Arab Emirates'],
									  	"First China War was fought between" => [['China and Britain', 'China and France','China and Egypt','China and Greek'], 'China and Britain'],
									  	"For the Olympics and World Tournaments, the dimensions of basketball court are" => [['26 m x 14 m', '27 m x 16 m', '28 m x 15 m', '28 m x 16 m'], '28 m x 15 m'],
									  	"Each year World Red Cross and Red Crescent Day is celebrated on" => [['08/May', '08/Jun', '18/May', '18/Jun'], '08/May'],
									  	"Gravity setting chambers are used in industries to remove" => [['SOx', 'NOx', 'suspended particulate matter', 'CO'], 'suspended particulate matter']
								  	}
		count = 1
		question_array.each do |ques, answers|
      puts ques
      puts '---------------------'
      puts answers
      question = Question.new(text: ques,
                              pick: 'one', 
                              display_order: count,
                              display_type: "default")
      question.save
      count += 1
			answers[0].each do |ans|
				if ans == answers[1]
					answer = question.answers.create!(text: ans, is_correct: true)
				else
					question.answers.create!(text: ans)
				end
			end
		end
		puts "total count"
		puts Question.all.size
		puts Answer.all.size
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
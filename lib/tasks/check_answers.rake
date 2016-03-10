namespace :questions do
  task check_answers: :environment do
    questions = Question.includes(:answers)
    invalid_questions = []
    questions.each do |question|
      correct_answers = question.answers.select { |a| a.correct? }
      if correct_answers.empty?
        invalid_questions << question.id
      end
    end

  puts "The below questions IDs have no correct answer defined: #{invalid_questions.inspect}" unless invalid_questions.empty?
  end
end

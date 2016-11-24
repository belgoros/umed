namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
    make_levels
    make_subjects
    make_themes
    make_questions
    make_answers
    make_plans
  end
end

def make_admin
  User.create(email: 'admin@example.com', password: 'changeme', password_confirmation: 'changeme', admin: true)
  puts "Created Admin user"
end

def make_levels
  2.times do
    level = Level.create(name: FFaker::Lorem.phrase)
  end
  puts "Created #{Level.count} Levels"
end

def make_subjects
  levels = Level.all
  levels.each do |level|
    3.times do
      subject = level.subjects.create!(name: "#{FFaker::Lorem.phrase}")
    end
  end
  puts "Created #{Subject.count} Subjects"
end

def make_themes
  subjects = Subject.all
  subjects.each do |subject|
    3.times do
      subject.themes.create!(name: FFaker::Lorem.phrase)
    end
  end
  puts "Created #{Theme.count} Themes"
end

def make_questions
  themes = Theme.all
  themes.each do |theme|
    3.times do
      theme.questions.create!(text: FFaker::Lorem.phrase)
    end
  end
  puts "Created #{Question.count} Questions"
end

def make_answers
  questions = Question.all
  questions.each do |question|
    2.times do
      question.answers.create!(text: FFaker::Lorem.phrase, correct: false)
    end
    question.answers.create!(text: FFaker::Lorem.phrase, correct: true)
  end
  puts "Created #{Answer.count} Answers"
end

def make_plans
  Plan.create!(name: 'free', description: 'Gratuit', price: 0.0, duration: 9999, questions: 20)
  Plan.create!(name: 'premium', description: 'Premium', price: 3.0, duration: 1, questions: 1000)
  Plan.create!(name: 'premium+', description: 'Premium Plus', price: 7.0, duration: 3, questions: 1000)
end

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
    make_levels
    make_subjects
    make_themes
    make_questions
    make_answers
  end
end

def make_admin
  User.create(email: 'admin@example.com', password: 'changeme', password_confirmation: 'changeme', admin: true)
end

def make_levels
  2.times do
    Level.create!(name: FFaker::Lorem.phrase)
  end
end

def make_subjects
  5.times do
    Subject.create!(name: FFaker::Lorem.phrase, level: Level.first)
  end
end

def make_themes
  subject_1 = Subject.first
  subject_2 = Subject.last
  5.times do
    Theme.create!(name: FFaker::Lorem.phrase, subject: subject_1)
    Theme.create!(name: FFaker::Lorem.phrase, subject: subject_2)
  end
end

def make_questions
  themes = Theme.all
  themes.each do |theme|
    3.times do
      Question.create!(text: FFaker::Lorem.phrase, theme: theme)
    end
  end
end

def make_answers
  questions = Question.all
  questions.each do |question|
    2.times do
      Answer.create!(text: FFaker::Lorem.phrase, question: question, correct: false)
    end
    Answer.create!(text: FFaker::Lorem.phrase, question: question, correct: true)
  end
end

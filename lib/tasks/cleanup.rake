namespace :cleanup do
  desc "removes stale and uncomplete quizzes from the database"
  task :quizzes => :environment do
    stale_quizzes = Quiz.where("DATE(created_at) < DATE(?)", Date.yesterday).where("level_id is NULL or subject_id is NULL or theme_id is NULL")

    # delete them
    stale_quizzes.map(&:destroy)
  end
end

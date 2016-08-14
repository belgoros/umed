namespace :cleanup do
  desc "removes stale and incomplete quizzes from the database"
  task quizzes: :environment do
    clean_and_keep_recent(25)
  end
end

# Delete incomplete quizzes
def delete_incomplete_quzzes
  stale_quizzes = Quiz.where("DATE(created_at) < DATE(?)", Date.yesterday).where("level_id is NULL or subject_id is NULL or theme_id is NULL")
  stale_quizzes.map(&:destroy)
end

# Delete all the quizzes and the last only (25 by default)
def clean_and_keep_recent(to_keep = 25)
  users = User.includes(:quizzes)
  users.each do |user|
    ids = user.quizzes.order('created_at DESC').limit(to_keep).pluck(:id)
    Quiz.where(id: ids).delete_all
  end
end

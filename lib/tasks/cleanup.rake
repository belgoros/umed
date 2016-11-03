namespace :cleanup do
  desc "removes stale and incomplete quizzes from the database"
  task quizzes: :environment do
    clean_and_keep_recent
  end
end

# Delete incomplete quizzes
def delete_incomplete_quzzes
  stale_quizzes = Quiz.where("DATE(created_at) < DATE(?)", Date.yesterday).where("level_id is NULL or subject_id is NULL or theme_id is NULL")
  stale_quizzes.map(&:destroy)
end

# Delete all the previous quizzes and keep the last only (25 by default)
def clean_and_keep_recent(to_keep = 5)
  users = User.includes(:quizzes)
  users.each do |user|
    ids = user.quizzes.order(created_at: :desc).offset(to_keep).pluck(:id)
    Quiz.where(id: ids).delete_all
  end
end

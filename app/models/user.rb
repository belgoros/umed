class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :subscriptions, dependent: :destroy
   has_many :quizzes, dependent: :destroy

   after_create :send_welcome_email

  def self.delete_old_quizzes
    old_quizzes = []
    users = includes(:quizzes)
    users.each do |user|
      old_quizzes =+ user.quizzes.offset(25) unless user.quizzes.empty?
    end

    old_quizzes.delete_all
  end


   private
   def send_welcome_email
     UserMailer.welcome_email(self).deliver_now
   end
end

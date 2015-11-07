class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :theme

  validates :text, presence: true
end

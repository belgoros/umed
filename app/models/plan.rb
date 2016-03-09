class Plan < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  validates :description, :duration, :price, :questions, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :duration, :questions, numericality: { only_integer: true }
  validates :price, numericality: true

  scope :priced, -> { where.not(price: 0) }

  def total_in_cents
    (price * 100).round
  end
end

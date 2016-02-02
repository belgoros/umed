class Theme < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  belongs_to :subject

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :subject_id, presence: true
end

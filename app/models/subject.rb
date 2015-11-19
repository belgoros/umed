class Subject < ActiveRecord::Base
  has_many :themes, dependent: :destroy
  belongs_to :level
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :level_id, presence: true
end

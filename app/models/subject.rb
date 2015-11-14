class Subject < ActiveRecord::Base
  has_many :themes, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

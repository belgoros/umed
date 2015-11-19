class Level < ActiveRecord::Base
  has_many :subjects, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

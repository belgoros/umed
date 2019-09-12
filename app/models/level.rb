class Level < ApplicationRecord
  has_many :subjects, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

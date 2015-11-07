class Subject < ActiveRecord::Base
  has_many :themes, dependent: :detroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

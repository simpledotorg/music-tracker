class Album < ApplicationRecord
  has_many :tracks

  validates :artist, presence: true
  validates :title, presence: true
end

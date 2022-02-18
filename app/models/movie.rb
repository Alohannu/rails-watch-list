class Movie < ApplicationRecord
  validates :title, :overview, uniqueness: true
  has_many :bookmarks
  validates :title, :overview, presence: true
end

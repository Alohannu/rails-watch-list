class List < ApplicationRecord
  validates :name, uniqueness: true
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true
  has_one_attached :photo
  end

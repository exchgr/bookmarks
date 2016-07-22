class Bookmark < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, url: true
end

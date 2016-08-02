class Bookmark < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, url: true

  acts_as_taggable
end

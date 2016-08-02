class Bookmark < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true, url: true

  acts_as_taggable

  class << self
    def with_tags_json
      includes(:tags).as_json(include: {tags: {only: [:id, :name]}})
    end
  end
end

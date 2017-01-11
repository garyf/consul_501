class Song < ActiveRecord::Base
  default_scope { where(trashed: true) }

  scope :recent, -> { where("created_at > ?", 1.week.ago) }

end

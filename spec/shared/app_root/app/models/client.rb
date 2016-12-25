class Client < ActiveRecord::Base
  has_many :notes

  scope :active, -> { where("deleted = ? OR deleted IS NULL", false) }
end

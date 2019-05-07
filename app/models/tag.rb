class Tag < ApplicationRecord
  def self.STATUSES
    ['new', 'blocked', 'in_progress', 'fixed']
  end

  has_many :taggings
  has_many :tickets, through: :taggings

  validates :name, presence: true
end
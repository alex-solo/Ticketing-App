class Tag < ApplicationRecord
  def self.STATUSES
    ['new', 'blocked', 'in_progress', 'fixed']
  end

  has_many :taggings
  has_many :tickets, through: :taggings

  validates :name, presence: true

  def self.get_tags_tickets
    result = {}
    Tag.all.each do |tag|
      result[tag.name] = tag.tickets.size
    end
    result
  end
end
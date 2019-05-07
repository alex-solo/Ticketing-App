class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :name, presence: true

  def open_tickets
    self.tickets.where.not(status: 'fixed')
  end
end
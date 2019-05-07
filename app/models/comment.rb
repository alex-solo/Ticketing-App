class Comment < ApplicationRecord
  belongs_to :creator, class_name: "User"
  belongs_to :ticket

  validates :body, presence: true
end
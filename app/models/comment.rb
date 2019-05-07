class Comment < ApplicationRecord
  belongs_to :creator, class_name: "User", required: false
  belongs_to :ticket, required: false

  validates :body, presence: true
end
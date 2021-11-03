class Activity < ApplicationRecord
  validates :message, presence: true
end
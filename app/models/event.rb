class Event < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  has_many :attendances
  has_many :attendees, through: :attendances, source: 'user'
end

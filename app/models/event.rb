class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: 'user'

  validates :title, presence: true
  validates :content, presence:true
end

# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: 'user'

  scope :past, -> { where("start <= DateTime('now')") }
  scope :upcoming, -> { where("start > DateTime('now')") }

  validates :title, presence: true
  validates :content, presence: true
  validates :start, presence: true
end

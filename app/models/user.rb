class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', dependent: :delete_all
  has_many :attendances
  has_many :attended_event, through: :attendances, source: 'event'

  validates :name,presence:true
  validates :email, presence:true
end

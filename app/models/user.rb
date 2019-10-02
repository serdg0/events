class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', dependent: :delete_all
  has_many :attendances
  has_many :attended_event, through: :attendances, source: 'event'

  validates :name,presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end

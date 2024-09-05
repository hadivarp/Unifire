class User < ApplicationRecord

  has_many :events, dependent: :destroy
  has_many :organized_books, class_name: 'Book', foreign_key: 'organizer_id'
  has_many :attended_books, class_name: 'Book', foreign_key: 'attendee_id'

  has_many :organized_events, through: :organized_books, source: :event
  has_many :attended_events, through: :attended_books, source: :event

  # Use Active Record validations instead of a before_create callback
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  # Custom validation method
  validate :passwords_must_match

  private

  def passwords_must_match
    if password != password_confirmation
      errors.add(:password, "and Password Confirmation must match")
    end
  end
end
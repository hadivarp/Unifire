class Event < ApplicationRecord
  belongs_to :user
  has_many :books
  has_many :organizers, through: :books, source: :organizer
  has_many :attendees, through: :books, source: :attendee

  enum status: { active: 0, inactive: 1 }
  enum event_type: { default: 0, one_off: 1, meeting: 2 }

end
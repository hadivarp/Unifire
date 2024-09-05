class Book < ApplicationRecord
  belongs_to :event
  belongs_to :organizer, class_name: 'User'
  belongs_to :attendee, class_name: 'User'
end

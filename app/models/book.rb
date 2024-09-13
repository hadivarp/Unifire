class Book < ApplicationRecord
  belongs_to :event
  belongs_to :organizer, class_name: 'User'
  belongs_to :attendee, class_name: 'User'


  enum status: { pending: 0, accepted: 1, declined: 2 }

end

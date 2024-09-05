class Event < ApplicationRecord
  belongs_to :user

  enum status: { active: 0, inactive: 1 }
  enum event_type: { interview: 0, meeting: 1, call: 2 }

end
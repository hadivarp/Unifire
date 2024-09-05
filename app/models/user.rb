class User < ApplicationRecord
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
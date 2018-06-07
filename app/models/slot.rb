class Slot < ApplicationRecord
  # Direct associations

  belongs_to :event

  belongs_to :user

  # Indirect associations

  # Validations

  validates :event_id, :presence => true

end

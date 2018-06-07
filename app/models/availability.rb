class Availability < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :slot_id, :uniqueness => { :scope => [:user_id] }

  validates :user_id, :presence => true

end

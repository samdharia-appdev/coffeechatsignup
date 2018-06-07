class Availability < ApplicationRecord
  # Direct associations

  belongs_to :slot

  belongs_to :user

  # Indirect associations

  # Validations

  validates :slot_id, :uniqueness => { :scope => [:user_id] }

  validates :user_id, :presence => true

end

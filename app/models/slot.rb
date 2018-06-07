class Slot < ApplicationRecord
  # Direct associations

  has_many   :availabilities,
             :dependent => :destroy

  belongs_to :event

  belongs_to :user

  # Indirect associations

  has_many   :interested_users,
             :through => :availabilities,
             :source => :user

  # Validations

  validates :event_id, :presence => true

end

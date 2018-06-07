class Event < ApplicationRecord
  # Direct associations

  has_many   :slots,
             :dependent => :destroy

  belongs_to :company

  # Indirect associations

  # Validations

end

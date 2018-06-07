class Event < ApplicationRecord
  # Direct associations

  has_many   :slots,
             :dependent => :destroy

  belongs_to :company

  # Indirect associations

  has_many   :interested_users,
             :through => :slots,
             :source => :interested_users

  has_many   :registered_users,
             :through => :slots,
             :source => :user

  # Validations

end

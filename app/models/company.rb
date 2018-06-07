class Company < ApplicationRecord
  # Direct associations

  has_many   :events,
             :dependent => :destroy

  # Indirect associations

  has_many   :interested_users,
             :through => :events,
             :source => :interested_users

  has_many   :registered_users,
             :through => :events,
             :source => :registered_users

  # Validations

  validates :company_name, :uniqueness => true

  validates :company_name, :presence => true

end

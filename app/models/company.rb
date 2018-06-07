class Company < ApplicationRecord
  # Direct associations

  has_many   :events,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :company_name, :uniqueness => true

  validates :company_name, :presence => true

end

class User < ApplicationRecord
  # Direct associations

  has_many   :slots,
             :dependent => :destroy

  has_many   :availabilities,
             :dependent => :destroy

  # Indirect associations

  has_many   :available_slots,
             :through => :availabilities,
             :source => :slot

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

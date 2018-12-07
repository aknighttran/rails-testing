class School < ApplicationRecord
  # Validations
  validates_presence_of :name, :address, :principal, :capacity, :private_school
  validates_uniqueness_of :name, case_sensitive: true
  
  # Associations
  has_many :students, dependent: :destroy
end

class Patient < ApplicationRecord
  belongs_to :specialty
  belongs_to :diagnosis
  belongs_to :clinic
  belongs_to :counter_reference

  enum medical_query: [:embarazo, :cesaria]
  enum gender: [:masculino, :femenino]
end

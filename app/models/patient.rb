class Patient < ApplicationRecord
  has_many :clinical_references
  has_many :clinical_counter_references, through: :clinical_references

  enum gender: [:masculino, :femenino]

  accepts_nested_attributes_for :clinical_references, allow_destroy: false
end

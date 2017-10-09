class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :notes, dependent: :destroy
end

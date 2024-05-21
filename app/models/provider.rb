class Provider < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :address, presence: true
end

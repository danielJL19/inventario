class Product < ApplicationRecord
  has_many :movements
  belongs_to :category
  belongs_to :provider

  validates :name, presence: true
  validates :description, presence: true
  validates :serial_number, presence: true
  validates :unit_cost, presence: true
  validates :sale_price, presence: true
  validates :amount, presence: true
  require 'csv'

  def self.to_csv
    attributes = %w{id name description category}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |product|
        csv << attributes.map { |attr| product.send(attr)}
      end

    end
  end


end

class Seller < ApplicationRecord
  has_many :sales

  validates :name, :address, presence: true
end

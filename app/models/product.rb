class Product < ApplicationRecord
  has_many :sales

  validates :description, :price_per_piece, presence: true
end

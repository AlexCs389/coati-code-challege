class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :product
  belongs_to :seller

  validates :amount_of_pieces, :client, :product, :seller, presence: true
end

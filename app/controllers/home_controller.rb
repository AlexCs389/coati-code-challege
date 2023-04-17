class HomeController < ApplicationController
  def index
    @sales = Sale.includes(:client, :product, :seller)
  end

  def add_data
  end

  def import_new_data
  end
end

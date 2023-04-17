class HomeController < ApplicationController
  def index
    @sales = Sale.includes(:client, :product, :seller)
  end

  def add_data
    TSV[params[:file].path].map do |row|
      p row['Cliente']
    end
  end

  def import_new_data
  end
end

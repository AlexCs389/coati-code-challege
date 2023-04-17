class HomeController < ApplicationController
  def index
    @sales = Sale.includes(:client, :product, :seller)
  end

  def add_data
    file_path = params[:file].blank? ? nil : params[:file].path
    result = User::ImportData.run(file_path: file_path)
    p result
  end

  def import_new_data
  end
end

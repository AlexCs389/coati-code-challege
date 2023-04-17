class HomeController < ApplicationController
  def index
    @sales = Sale.includes(:client, :product, :seller)
  end

  def add_data
    file_path = params[:file].blank? ? nil : params[:file].path
    result = User::ImportData.run(file_path: file_path)
    
    if result.valid?
      redirect_to :home_index
    else
      redirect_to :import_new_data_home_index
    end
  end

  def import_new_data
  end
end

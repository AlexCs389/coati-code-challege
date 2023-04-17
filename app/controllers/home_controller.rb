class HomeController < ApplicationController
  def index
    @sales = Sale.includes(:client, :product, :seller)
                 .page(params[:page])
  end

  def add_data
    file_path = params[:file].blank? ? nil : params[:file].path
    result = User::ImportData.run(file_path: file_path)
    
    if result.valid?
      redirect_to :home_index, notice: 'Datos importados exitosamente'
    else
      redirect_to :import_new_data_home_index, alert: result.errors.full_messages.join(', ')
    end
  end

  def import_new_data
  end
end

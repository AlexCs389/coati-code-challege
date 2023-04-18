require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'POST #add_data' do

    context 'Importando datos desde un archivo .tsv válido' do
      before do
        file = fixture_file_upload(
          Rails.root.join(
            'spec',
            'fixtures',
            'files',
            'valid_test_file.tsv'
            ),
            'text/tab-separated-values'
        )
        post :add_data, params: { file: file }
      end

      it 'Redirecciona a la pantalla de index en caso de exito.' do
        expect(response).to redirect_to(home_index_path)
      end
      it 'Manda un flash notice con un mensaje exitoso.' do
        expect(flash[:notice]).to match(/Datos importados exitosamente/)
      end
      it 'Verificar que se guardaron elementos en la base de datos corrctamente.' do
        expect(Sale.count).to be > 0
      end
    end

    context 'Importando datos desde un archivo .tsv invalido' do
      before do
        file = fixture_file_upload(
          Rails.root.join(
            'spec',
            'fixtures',
            'files',
            'invalid_test_file.tsv'
          ),
          'text/tab-separated-values'
        )
        post :add_data, params: { file: file }
      end

      it 'Redirecciona a la misma pantalla de importar datos en caso de error.' do
        expect(response).to redirect_to(import_new_data_home_index_path)
      end
      it 'Manda un flash alert con un mensaje de error.' do
        expect(flash[:alert]).to match(/Amount of pieces can't be blank/)
      end
    end

    context 'Enviando un archivo nulo' do
      before do
        post :add_data, params: { file: nil }
      end

      it 'Redirecciona a la misma pantalla de importar datos en caso de error.' do
        expect(response).to redirect_to(import_new_data_home_index_path)
      end
      it 'Manda un flash alert con un mensaje de error.' do
        expect(flash[:alert]).to match(/File path is required/)
      end
    end

  end
end

class User::ImportData < ActiveInteraction::Base
    string :file_path

    def execute
        TSV[file_path].map do |row|
          sale = Sale.new(amount_of_pieces: row['Numero de piezas'])

          sale.client = Client.find_or_initialize_by(name: row['Cliente'])

          sale.product = Product.find_or_initialize_by(
            description: row['Descripción del Producto'],
            price_per_piece: row['Precio por pieza']
          )

          sale.seller = Seller.find_or_initialize_by(
            name: row['Nombre del Vendedor'],
            address: row['Diección del vendedor']
          )

          unless sale.save
            errors.merge!(sale.errors)
            break
          end
        end
    end
  end
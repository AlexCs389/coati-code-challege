class User::ImportData < ActiveInteraction::Base
    string :file_path

    def execute
        TSV[file_path].map do |row|
          p row['Cliente']
        end
    end
  end
class AddDocumentCreationDateToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :date_of_document, :datetime
  end
end

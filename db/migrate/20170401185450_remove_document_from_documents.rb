class RemoveDocumentFromDocuments < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :document_file_name, :string
    remove_column :documents, :document_content_type, :string
    remove_column :documents, :document_file_size, :integer
    remove_column :documents, :document_updated_at, :datetime
  end
end

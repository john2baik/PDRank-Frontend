class RemoveDocumentFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :document, :String
    remove_column :users, :document_file_name, :String
    remove_column :users, :document_content_type, :String
  end
end


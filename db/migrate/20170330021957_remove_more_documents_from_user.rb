class RemoveMoreDocumentsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :document_file_size, :Integer
    remove_column :users, :document_updated_at, :datetime
  end
end

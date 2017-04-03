class RemoveMoreDocumentsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :document_file_size, :integer
    remove_column :users, :document_updated_at, :datetime
  end
end

class RemoveColumnsFromDocument < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :documentName, :String
    remove_column :documents, :documentCreationDate, :datetime
  end
end

class AddDocumentToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :document, :string
  end
end

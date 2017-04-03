class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :documentName
      t.string :author
      t.text :body
      t.datetime :documentCreationDate
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :documents, [:user_id, :created_at]
  end
end

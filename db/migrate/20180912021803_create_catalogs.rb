class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :code, null: false , limit: 10
      t.string :parent_code, limit: 10
      t.string :name, null: false, limit: 250
      t.string :description, limit: 500
      t.boolean :active, null: false,  default: true

      t.timestamps
    end
    add_index :catalogs, :code, unique: true
  end
end

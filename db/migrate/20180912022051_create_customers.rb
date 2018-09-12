class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false , limit: 1000
      t.string :city, null: false , limit: 10
      t.string :direction, limit: 5000
      t.string :observation, limit: 5000
      t.boolean :active, null: false,  default: true

      t.timestamps
    end
    add_foreign_key :customers, :catalogs, column: :city, primary_key: :code
  end
end

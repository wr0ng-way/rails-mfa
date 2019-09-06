class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :price
      t.string :sku
      t.string :author
      t.string :publisher

      t.timestamps
    end
  end
end

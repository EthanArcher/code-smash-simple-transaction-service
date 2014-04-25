class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.decimal :total
      t.string :items

      t.timestamps
    end
  end
end

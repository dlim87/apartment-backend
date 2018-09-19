class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.text :address_1
      t.text :address_2
      t.text :city
      t.integer :post_code
      t.string :state
      t.text :country
      t.string :manager_name
      t.bigint :manager_number
      t.text :manager_time

      t.timestamps
    end
  end
end

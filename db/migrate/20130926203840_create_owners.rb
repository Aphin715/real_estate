class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.integer :building_id

      t.timestamps
    end
  end
end

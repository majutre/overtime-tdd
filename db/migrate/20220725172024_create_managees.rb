class CreateManagees < ActiveRecord::Migration[6.1]
  def change
    create_table :managees do |t|
      t.integer :managee_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.integer :mobile_number
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

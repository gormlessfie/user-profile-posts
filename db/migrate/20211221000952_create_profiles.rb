class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.references :user

      t.timestamps
    end
  end
end

class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :probability
      t.integer :test_id

      t.timestamps
    end
  end
end

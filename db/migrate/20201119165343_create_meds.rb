class CreateMeds < ActiveRecord::Migration[6.0]
  def change
    create_table :meds do |t|
      t.string :name
      t.string :pill_color
      t.string :pill_shape
      t.string :image_url

      t.timestamps
    end
  end
end

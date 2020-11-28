class AddDetailsToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :height, :integer
    add_column :patients, :weight, :integer
    add_column :patients, :age, :integer
    add_column :patients, :gender, :string
  end
end

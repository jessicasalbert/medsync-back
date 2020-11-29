class AddRxcuiToMeds < ActiveRecord::Migration[6.0]
  def change
    add_column :meds, :rxcui, :string
  end
end

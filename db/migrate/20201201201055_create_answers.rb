class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :symptom
      t.string :response
      t.string :question
      t.integer :test_id

      t.timestamps
    end
  end
end

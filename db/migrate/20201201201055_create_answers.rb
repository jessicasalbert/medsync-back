class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :symptom
      t.string :response
      t.string :question

      t.timestamps
    end
  end
end

class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :text
      t.boolean :correct, default: false
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

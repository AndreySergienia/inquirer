class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :text
      t.references :vote, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

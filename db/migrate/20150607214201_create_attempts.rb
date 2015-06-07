class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :vote, index: true, foreign_key: true
      t.integer :result

      t.timestamps null: false
    end
  end
end

class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.integer :weight, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

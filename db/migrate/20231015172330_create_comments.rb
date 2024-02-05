class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :public_notes
      t.integer :news_id, null:false, foreign_key: true

      t.timestamps
    end
  end
end

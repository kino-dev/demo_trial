class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.string :source

      t.timestamps
    end
  end
end

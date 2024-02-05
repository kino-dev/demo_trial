class AddSourceToNews < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :source, :string
  end
end

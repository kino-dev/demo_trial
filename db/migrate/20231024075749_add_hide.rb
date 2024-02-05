class AddHide < ActiveRecord::Migration[7.0]
  def change
    add_column :news, :hide, :boolean
  end
end

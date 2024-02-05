class Hidedatatype < ActiveRecord::Migration[7.0]
  def change
    change_column(:news, :hide, :integer)
  end
end

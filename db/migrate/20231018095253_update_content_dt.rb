class UpdateContentDt < ActiveRecord::Migration[7.0]
  def change
    change_column(:news, :content, :text)
  end
end

class UpdateNewsidDatetype < ActiveRecord::Migration[7.0]
  def change
    change_column(:comments, :news_id, :integer)
  end
end

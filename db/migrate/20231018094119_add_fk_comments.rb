class AddFkComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :news, column: :news_id
  end
end

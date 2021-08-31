class RemoveAddFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :ADD, :string
  end
end

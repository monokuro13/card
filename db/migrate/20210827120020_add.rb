class Add < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :ADD, :string
  end
end

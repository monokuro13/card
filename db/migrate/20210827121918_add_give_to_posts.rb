class AddGiveToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :give, :string
  end
end

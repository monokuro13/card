class AddRequestToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :request, :string
  end
end

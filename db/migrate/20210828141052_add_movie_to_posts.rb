class AddMovieToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :movie, :string
  end
end

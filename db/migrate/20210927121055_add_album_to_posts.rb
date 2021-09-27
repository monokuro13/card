class AddAlbumToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :album, :string
  end
end

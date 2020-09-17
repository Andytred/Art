class AddressToArtwork < ActiveRecord::Migration[6.0]
  def change
    add_column :artworks, :address, :string
  end
end

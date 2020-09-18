class FixAddressInArtworks < ActiveRecord::Migration[6.0]
  def change
    if !column_exists?(:artworks, :address)
      add_column :artworks, :address, :string 
    end
  end
end

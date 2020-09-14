class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :artworks, :user
  end
end

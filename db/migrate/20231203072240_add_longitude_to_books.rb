class AddLongitudeToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :longitude, :float
  end
end

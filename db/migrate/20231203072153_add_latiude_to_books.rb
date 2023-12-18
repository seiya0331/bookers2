class AddLatiudeToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :latitude, :float
  end
end

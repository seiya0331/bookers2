class AddAddressToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :address, :string
  end
end

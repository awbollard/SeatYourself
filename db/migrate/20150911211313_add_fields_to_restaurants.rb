class AddFieldsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :address, :string
    add_column :restaurants, :opening_time, :time
    add_column :restaurants, :closing_time, :time
    add_column :restaurants, :price, :string
    add_column :restaurants, :description, :string
    add_column :restaurants, :city, :string
  end
end

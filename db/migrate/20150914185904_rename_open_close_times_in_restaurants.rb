class RenameOpenCloseTimesInRestaurants < ActiveRecord::Migration
  def change
  	change_column :restaurants, :opening_time, :integer
  	change_column :restaurants, :closing_time, :integer
  end
end

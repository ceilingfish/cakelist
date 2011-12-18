class AddShortNameToGuest < ActiveRecord::Migration
  def self.up
  	add_column :guests, :short_name, :boolean
  end

  def self.down
  	remove_column :guests, :short_name
  end
end

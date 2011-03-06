class AddIsRsvpdToGuest < ActiveRecord::Migration
  def self.up
	add_column :guests, :is_rsvpd, :boolean
  end

  def self.down
	remove_column :guests, :is_rsvpd
  end
end

class CreateMenuContributions < ActiveRecord::Migration
  def self.up
    create_table :menu_contributions do |t|
      t.integer :menu_item_id
      t.integer :guest_id
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_contributions
  end
end

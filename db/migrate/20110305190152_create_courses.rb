class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
	t.string :name
      t.timestamps
    end

    add_column :menu_items, :course_id, :int
  end

  def self.down
    drop_table :courses

    remove_column :menu_items, :course_id
  end
end

class Guest < ActiveRecord::Base
	
	validates :name, :presence => true

	has_one :partner, :class_name => "Guest", :foreign_key => "partner_id"
end

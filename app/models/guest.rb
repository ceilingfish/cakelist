class Guest < ActiveRecord::Base
	has_one :partner, :class_name => "Guest", :foreign_key => "partner_id"
end

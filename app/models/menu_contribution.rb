class MenuContribution < ActiveRecord::Base
	#validates_inclusion_of :type, :in => ["paid", "made"]
	
	has_one :menu_item
	has_one :guest
end

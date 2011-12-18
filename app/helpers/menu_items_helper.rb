module MenuItemsHelper
	
	def all_guest_food(guest)
		guest.menu_items + (guest.partner ? guest.partner.menu_items : [])
	end
	
end

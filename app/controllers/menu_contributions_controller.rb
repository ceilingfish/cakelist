class MenuContributionsController < ApplicationController
	
	def create
		@menu_contribution = MenuContribution.new(params[:menu_contribution])
		@menu_item = MenuItem.where(:name.matches => params[:menu_item][:name].gsub(/%/,"")).first
		
		@menu_item = MenuItem.create(params[:menu_item]) if @menu_item.nil?
		
		@menu_contribution.menu_item = @menu_item
		
		if @menu_contribution.save!
			flash[:thankyou] = "You wonderful, wonderful person!"
			redirect_to menu_items_url
		else
			flash[:error] = "Oh, something went wrong!"
			redirect_to new_menu_items_url
		end
		
	end
end

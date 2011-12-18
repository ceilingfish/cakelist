class MenuItemsController < ApplicationController

	before_filter :get_menu_item, :only => [:bring, :buy]

	def index
		@courses = Course.all
	end
	
	def bring
		
	end

	def buy
	end
	
	def find
		render :json => MenuItem.where(:name.matches => "#{params[:term]}%").map{ | g | g.name }
	end
	
	def get_menu_item
		@menu_item = MenuItem.find params[:id]
	end
end

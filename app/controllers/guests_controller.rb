class GuestsController < ApplicationController
	def rsvp
		
		if params[:guest][:id]
			@guest = Guest.find params[:guest][:id]
		else
			@guest = Guest.where(:name.matches => params[:guest][:name].gsub(/%/,"")).first
		end
		
		if @guest
			@guest.update_attributes(:is_rsvpd => true)
			render :json => @guest, :include => :partner, :status => 200
		else
			render :nothing => true, :status => 404
		end
	end
	
	def confirm_rsvp
		@guest = Guest.find params[:guest][:id]
		@partner = @guest.partner
		
		render :layout => false
	end

	def find
		render :json => Guest.where(:name.matches => "#{params[:term]}%").map{ | g | g.name }
	end		
end

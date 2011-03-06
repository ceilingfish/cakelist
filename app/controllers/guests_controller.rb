class GuestsController < ApplicationController
	def rsvp
		@guest = Guest.find params[:id]
		@guest.update_attributes(:is_rsvpd => true)
	end

	def find
		render :json => Guest.where(:name.matches => "#{params[:term]}%").map{ | g | g.name }
	end		
end

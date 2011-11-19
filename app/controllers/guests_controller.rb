class GuestsController < ApplicationController
	
	def create
		@guest = Guest.new(params[:guest])
		
		if @guest.save
			Guest.find(@guest.partner_id).update_attributes(:partner_id => @guest.id) if @guest.partner_id
			render :status => 200, :nothing => true
		else
			render :status => 400, :text => @guest.errors.full_messages.to_sentence
		end
	end
	
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

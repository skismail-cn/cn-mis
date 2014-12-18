class LocationsController < ApplicationController

	def index
#===========practice ====================		
=begin
loc_array = Array.new(7) do |l|
l
end
5.times {loc_array << 5 }
loc_array.delete(5)

arr = ['a', 'b', 'c', 'd', 'e', 'f']

render plain: loc_array.inspect
#render plain: loc_hash.inspect
return false
=end
#===========practice ====================

		@locations = Location.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @locations.as_csv }
  		end
	end

	def new
		@location = Location.new
	end

	def create
		@location = Location.create(location_params)
		if @location.save
			redirect_to location_path(@location)
		else
			render "new"
		end
	end

	def show
		@location = Location.find(params[:id])
	end

	def edit
		@location = Location.find(params[:id])
	end

	def update
		@location = Location.find(params[:id])
		if @location.update(location_params)
			redirect_to location_path(@location)
		else
			render "edit"
		end
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy
		redirect_to locations_path
	end

	def search
		if ""==params[:name] || " " == params[:name]
			redirect_to locations_path, :notice => "No locations matched your criteria!"
		else
			@locations = Location.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def location_params
			params.require(:location).permit(:name,:status)
		end
end

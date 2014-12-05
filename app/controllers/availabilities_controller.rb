class AvailabilitiesController < ApplicationController
	def index
		@availabilities = Availability.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @availabilities.as_csv }
  		end
	end

	def new
		@availability = Availability.new
	end

	def create
		@availability = Availability.create(availability_params)
		if @availability.save
			redirect_to availability_path(@availability)
		else
			render "new"
		end
	end

	def show
		@availability = Availability.find(params[:id])
		#render plain: @availability.inspect
	end

	def edit
		@availability = Availability.find(params[:id])
	end

	def update
		@availability = Availability.find(params[:id])
		if @availability.update(availability_params)
			redirect_to availability_path(@availability)
		else
			render "edit"
		end
	end

	def destroy
		@availability = Availability.find(params[:id])
		@availability.destroy
		redirect_to availabilities_path
	end

	def search
		if ""==params[:name] || " "==params[:name]
			redirect_to availabilities_path, :notice => "No availability matched your criteria!"
		else
			@availabilities = Availability.where("name ILIKE ?","%#{params[:name]}%").order(:name)
			#render plain: @availabilities.inspect
		end
		
	end

	private

		def availability_params
			params.require(:availability).permit(:name,:status)
		end
end

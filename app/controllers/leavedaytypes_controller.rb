class LeavedaytypesController < ApplicationController
	def index
		@leavedaytypes = Leavedaytype.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @leavedaytypes.as_csv }
  		end
	end

	def new
		@leavedaytype = Leavedaytype.new
	end

	def create
		@leavedaytype = Leavedaytype.create(leavedaytype_params)
		if @leavedaytype.save
			redirect_to leavedaytype_path(@leavedaytype),notice: 'Leave day type was successfully created.'
		else
			render "new",notice: 'Leave day type creation failed.'
		end
	end

	def show
		@leavedaytype = Leavedaytype.find(params[:id])
	end

	def edit
		@leavedaytype = Leavedaytype.find(params[:id])
	end

	def update
		@leavedaytype = Leavedaytype.find(params[:id])
		if @leavedaytype.update(leavedaytype_params)
			redirect_to leavedaytype_path(@leavedaytype), notice: 'Leavetype was successfully updated.'
		else
			render "edit", notice: 'Leavetype update failed.'
		end
	end

	def destroy
		@leavedaytype = Leavedaytype.find(params[:id])
		if @leavedaytype.destroy
			redirect_to leavedaytypes_path, notice: 'Leavetype was successfully deleted.'
		else
			redirect_to leavedaytypes_path, notice: 'Leavetype deletion failed.'
		end

	end

	def search
		if ""==params[:name] || " " == params[:name]
			redirect_to leavedaytypes_path, :notice => "No leave day types matched your criteria!"
		else
			@leavedaytypes = Leavedaytype.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def leavedaytype_params
			params.require(:leavedaytype).permit(:name,:status)
		end
end

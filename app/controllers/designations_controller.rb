class DesignationsController < ApplicationController
	def index
		@designations = Designation.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @designations.as_csv }
  		end
	end

	def new
		@designation = Designation.new
	end

	def create
		@designation = Designation.new(designation_params)
 
  		if @designation.save
  			redirect_to @designation
  		else
  			render 'new'
  		end
	end

	def show
		@designation = Designation.find(params[:id])
		#render plain: @designation.department.inspect
	end

	def edit
		@designation = Designation.find(params[:id])
	end

	def update
		@designation = Designation.find(params[:id])
		if @designation.update(designation_params)
			redirect_to @designation
		else
			render "edit"
		end
	end

	def destroy
		@designation = Designation.find(params[:id])
		@designation.destroy
		redirect_to designations_path
	end

	def search
	end

	def search_results
		
		if params[:name]!="" && params[:department]!=""
			query_string ="designations.name LIKE '%#{params[:name]}%' AND departments.name LIKE '%#{params[:department]}%'"
		elsif params[:name]!=""
			query_string = "designations.name LIKE '%#{params[:name]}%'"
		elsif params[:department]!=""
			query_string = "departments.name LIKE '%#{params[:department]}%'"
		else
			query_string= "designations.id < 0"
		end

		@designations = Designation.joins(:department).where(query_string).order(department_id: :desc)
	end

	private
		def designation_params
			params.require(:designation).permit(:name,:status,:department_id)
		end
end

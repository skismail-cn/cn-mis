class DesignationController < ApplicationController

	require 'csv'

	def index
		@designations = Designation.paginate(:page => params[:page])
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
		redirect_to designation_index_path
	end

	def search
	end

	def search_results
		if params[:name]!="" || params[:department]!=""
			query_string=""
			if params[:name]!="" && params[:department]!=""
				query_string ="designations.name LIKE '%#{params[:name]}%' OR departments.name LIKE '%#{params[:department]}%'"
			else
				if params[:name]!=""
					query_string = "designations.name LIKE '%#{params[:name]}%'"
				end
				if params[:department]!=""
					query_string += "departments.name LIKE '%#{params[:department]}%'"
				end
			end
			@designations = Designation.joins(:department).where(query_string)
		else
			redirect_to designation_index_path
		end
	end

	private
		def designation_params
			params.require(:designation).permit(:name,:status,:department_id)
		end
end

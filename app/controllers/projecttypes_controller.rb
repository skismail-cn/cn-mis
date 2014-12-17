class ProjecttypesController < ApplicationController

	def index
		@projecttypes = Projecttype.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @projecttypes.as_csv }
  		end
	end

	def new
		@projecttype = Projecttype.new
	end

	def create
		@projecttype = Projecttype.create(projecttype_params)
		if @projecttype.save
			redirect_to projecttype_path(@projecttype), notice: 'Project type created successfully.'
		else
			render "new", notice: 'project type creation failed!'
		end
	end

	def show
		@projecttype = Projecttype.find(params[:id])
	end

	def edit
		@projecttype = Projecttype.find(params[:id])
	end

	def update
		@projecttype = Projecttype.find(params[:id])
		if @projecttype.update(projecttype_params)
			redirect_to projecttype_path(@projecttype), notice: 'Project type Updated successfully.'
		else
			render "edit", notice: 'project type updation failed!'
		end
	end

	def destroy
		@projecttype = Projecttype.find(params[:id])
		if @projecttype.destroy
			redirect_to projecttypes_path, notice: 'Project type deleted successfully.'
		else
			redirect_to projecttypes_path, notice: 'project type deletion failed!'
		end
	end

	def search
		if ""==params[:name] || " " == params[:name]
			@projecttypes = nil
		else
			@projecttypes = Projecttype.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def projecttype_params
			params.require(:projecttype).permit(:name,:status)
		end	
end

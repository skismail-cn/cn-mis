class ProjectstatusesController < ApplicationController
	
	def index
		@projectstatuses = Projectstatus.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @projectstatuses.as_csv }
  		end
	end

	def new
		@projectstatus = Projectstatus.new()
	end

	def create
		@projectstatus = Projectstatus.create(projectststus_parsms)
		if @projectstatus.save
			redirect_to projectstatus_path(@projectstatus), notice: 'New project status created.'
		else
			render "new"
		end
	end

	def show
		@projectstatus = Projectstatus.find(params[:id])
	end

	def edit
		@projectstatus = Projectstatus.find(params[:id])
	end

	def update
		@projectstatus = Projectstatus.find(params[:id])
		if @projectstatus.update(projectststus_parsms)
			redirect_to projectstatus_path(@projectstatus), notice: 'project status updated.'
		else
			redirect_to projectstatus_path(@projectstatus), notice: 'project status update failed!.'
		end
	end

	def destroy
		@projectstatus = Projectstatus.find(params[:id])
		if @projectstatus.destroy
			redirect_to projectstatuses_path, notice: 'project status deleted successfully.'
		else
			redirect_to projectstatuses_path, notice: 'project status deletion failed.'
		end
	end

	def search
		if ""==params[:name] || " " == params[:name]
			@projectstatuses = nil
		else
			@projectstatuses = Projectstatus.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def projectststus_parsms
			params.require(:projectstatus).permit(:name,:status)
		end
end

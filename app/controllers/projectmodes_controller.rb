class ProjectmodesController < ApplicationController

	def index
		@projectmodes = Projectmode.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @projectmodes.as_csv }
  		end
	end

	def new
		@projectmode = Projectmode.new
	end

	def create
		@projectmode = Projectmode.create (projectmode_params)
		if @projectmode.save
			redirect_to projectmode_path(@projectmode), notice: 'Project mode created successfully.'
		else
			render "new", notice: 'Project mode creation failed!'
		end
	end

	def show
		@projectmode = Projectmode.find(params[:id])
	end

	def edit
		@projectmode = Projectmode.find(params[:id])
	end

	def update
		@projectmode = Projectmode.find(params[:id])
		if @projectmode.update(projectmode_params)
			redirect_to projectmode_path(@projectmode), notice: 'Project mode updated successfully.'
		else
			render "edit", notice: 'Project mode updation failed!'
		end
	end

	def destroy
		@projectmode = Projectmode.find(params[:id])
		if @projectmode.destroy
			redirect_to projectmodes_path , notice: 'Project mode deleted successfully.'
		else
			redirect_to projectmodes_path , notice: 'Project mode deletion failed.'
		end
	end

	def search
		if ""==params[:name] || " " == params[:name]
			@projectmodes = nil
		else
			@projectmodes = Projectmode.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def projectmode_params
			params.require(:projectmode).permit(:name,:status)
		end
end

class LeavestatusesController < ApplicationController
	def index
		@leavestatuses = Leavestatus.paginate(:page => params[:page]).order(:id)
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @leavestatuses.as_csv }
  		end
	end

	def new
		@leavestatus = Leavestatus.new
	end

	def create
		@leavestatus=Leavestatus.create(leavestatus_params)
		if @leavestatus.save
			redirect_to leavestatus_path(@leavestatus),:notice => 'leave status created successfully.'
		else
			render "new",:notice => 'leave status creation failed.'
		end
	end

	def show
		@leavestatus = Leavestatus.find(params[:id])
	end

	def edit
		@leavestatus = Leavestatus.find(params[:id])
	end

	def update
		@leavestatus = Leavestatus.find(params[:id])
		if @leavestatus.update(leavestatus_params)
			redirect_to leavestatus_path(@leavestatus),:notice => 'leave status updated successfully.'
		else
			render "edit",:notice => 'leave status update failed.'
		end
	end

	def destroy
		@leavestatus = Leavestatus.find(params[:id])
		if @leavestatus.destroy
			redirect_to leavestatuses_path,:notice => 'leave status deleted successfully.'
		else
			redirect_to leavestatuses_path,:notice => 'leave status deletion failed.'
		end
	end

	def search
		if ""==params[:name] || " " == params[:name]
			redirect_to leavestatuses_path, :notice => "No leave status matched your criteria!"
		else
			@leavestatuses = Leavestatus.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def leavestatus_params
			params.require(:leavestatus).permit(:name,:status)
		end
end

class LeavesController < ApplicationController
	def index
		@leaves = Leave.all.order(:id)
	end

	def new
		@leave = Leave.new
	end

	def create
		@leave = Leave.create(leave_params)
		if @leave.save
			redirect_to @leave , notice: 'Leave created successfully'
		else
			render 'new', notice: 'Leave creation failed, please retry!'
		end
	end

	def show
		@superior_name= "None"
		@leave = Leave.find(params[:id])
		if @leave.reporting_to
			superior = Member.select(:Name).find(@leave.reporting_to)
			if superior.Name
				@superior_name= superior.Name
			end
		end
	end

	def edit
		@leave = Leave.find(params[:id])
	end

	def update
		@leave = Leave.find(params[:id])
		if @leave.update(leave_params)
			redirect_to leafe_path(@leave), notice: 'leave updated successfully.'
		else
			render "edit", notice: 'leave update failed!'
		end
	end

	def destroy
		@leave = Leave.find(params[:id])
		if @leave.destroy
			redirect_to leaves_path, notice: 'leave deleted successfully.'
		else
			redirect_to leaves_path, notice: 'leave deletion failed!'
		end
	end

	def search
		
	end

	def fetchsuperior
		reporting_str = String.new
		member = Member.select(:Reporting_To).find(params[:applicant])

		if member && member.Reporting_To
			superior = Member.select(:id,:Name).find(member.Reporting_To)
			if superior && superior.id && superior.Name
				reporting_str = "<option value=#{superior.id}>#{superior.Name}</option>"
			end
		end
		render plain: reporting_str.inspect
		return false
	end

	private
		def leave_params
			params.require(:leave).permit(:member_id,:leavetype_id,:leavedaytype_id,:leavestatus_id,:contact_number,:reporting_to,
				:leave_start_date,:leave_end_date,:reason_for_leave,:comments)
		end
end

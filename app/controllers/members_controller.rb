class MembersController < ApplicationController
	def index
		@members = Member.paginate(:page => params[:page])
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @members.as_csv }
  		end
	end

	def new
		@member = Member.new
	end
	
	def create
		@member = Member.create(member_params)
		if @member.save
			redirect_to member_path(@member)
		else
			render "new"
		end
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
			redirect_to member_path(@member)
		else
			render "edit"
		end
	end

	def destroy
		@member = Member.find(params[:id])
		if @member.destroy
			redirect_to members_path, :notice => "Member deleted successfully"
		else
			redirect_to members_path, :notice => "Member deletion failed"
		end
	end

	def fetchdesignation
		designations_str = nil
		@designations = Designation.where("department_id = ?",params[:department]).order(:name)
		if @designations && @designations.length >0
			designations_str = ''
			@designations.each do |d|
				designations_str +="<option value=#{d.id}>#{d.name}</option>"
			end
		end
		render plain: designations_str.inspect
	end

	def member_params
		params.require(:member).permit(:Name,:Email,:department_id,:designation_id,:location_id,:Joining_Date,:Confirmation_Date,
		:hot_Skills,:Salary,:Reporting_To,:Earned_Leave,:Casual_Leave,:Sick_Leave,:password,:password_confirmation)
	end
end

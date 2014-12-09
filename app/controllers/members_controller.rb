class MembersController < ApplicationController
	def index
		@members = Member.all
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
		puts params[]
	end

	def member_params
		params.require(:member).permit(:Name,:Email,:Joining_Date,:Confirmation_Date,
		:Hot_Skills,:Salary,:Reporting_To,:Earned_Leave,:Casual_Leave,:Sick_Leave,:password,:password_confirmation)
	end
end

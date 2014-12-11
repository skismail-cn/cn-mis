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
		@member.hot_Skills = params['member']['hot_Skills'].delete_if { |a| a <="0" }.join(",")

		if @member.save
			redirect_to member_path(@member)
		else
			render "new"
		end
	end

	def show
		@superior_name= "None"
		@member = Member.find(params[:id])
		if @member.Reporting_To
			superior = Member.select(:Name).find(@member.Reporting_To)
			@superior_name= superior.Name
		end
		skill_set = Skill.select(:name).where("id in (#{@member.hot_Skills})")
		skill_set_str =""
		if skill_set && skill_set.length>0
			skill_set.each do |sss|
				skill_set_str += sss.name+", "
			end
		end
		@member.hot_Skills = skill_set_str
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		@member.hot_Skills = params['member']['hot_Skills'].split(/,/)
		if @member.update(member_params)
			redirect_to member_path(@member)
		else
			render "edit"
		end
	end

	def destroy
		@member = Member.find(params[:id])

		if Member.find_by Reporting_To: @member.id 
			redirect_to members_path, :notice => "Member deletion failed, has reporting personels"
		else
			if @member.destroy
				redirect_to members_path, :notice => "Member deleted successfully"
			else
				redirect_to members_path, :notice => "Member deletion failed"
			end
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

class ProjectsController < ApplicationController

	def index
		@projects = Project.paginate(:page => params[:page])
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @projects.as_csv }
  		end
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)

		@project.team_members = params['project']['team_members'].delete_if { |a| a <="0" }.join(",")

		if @project.save
			redirect_to @project , notice: "New project added, with id=#{@project.id}"
		else
			render "new", notice: 'Project creation failed!'
		end
	end

	def show
		@project = Project.find(params[:id])
		team_set = Member.select(:Name).where("id in (#{@project.team_members})")
		team_set_str =""
		if team_set && team_set.length>0
			team_set.each do |sss|
				team_set_str += sss.Name+", "
			end
		end
		@project.team_members = team_set_str
	end

	def edit
		@project = Project.find(params[:id])
		@project.team_members = @project.team_members.split(/,/)
	end

	def update
		@project = Project.find(params[:id])
		@project.team_members = params['project']['team_members'].delete_if { |a| a <="0" }.join(",") # team member array to string.
		
 		if @project.update(project_params)
			redirect_to @project, notice: 'Project updated successfuly.'
		else
			render 'edit', notice: 'Project updation failed!!'
		end
	end

	def destroy
		@project = Project.find(params[:id])
		if @project.destroy
			redirect_to projects_path, notice: 'project deleted successfuly.'
		else
			redirect_to projects_path, notice: 'project deletion failed!!'
		end
	end

	def search
		render plain: params.inspect
		return false
	end

	private
		def project_params
			params.require(:project).permit(:name, :client_name, :client_email, :bdm_name,:start_date, :end_date, :project_cost,:member_id,:team_members,:projectstatus_id,:projecttype_id,:projectmode_id,:department_id,:location_id )
		end
end

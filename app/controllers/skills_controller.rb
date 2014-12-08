class SkillsController < ApplicationController
	def index
		@skills = Skill.paginate(:page => params[:page]).order(:id)

		respond_to do |format|
	    	format.html
	    	format.csv { send_data @skills.as_csv }
  		end

	end

	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.create(skill_params)
		if @skill.save
			redirect_to skill_path(@skill)
		else
			render "new"
		end
	end

	def show
		@skill = Skill.find(params[:id])
		#render plain: @skill.inspect
	end

	def edit
		@skill = Skill.find(params[:id])
	end

	def update
		@skill = Skill.find(params[:id])
		if @skill.update(skill_params)
			redirect_to skill_path(@skill)
		else
			render "edit"
		end
	end

	def destroy
		@skill = Skill.find(params[:id])
		if @skill.destroy
			redirect_to skills_path
		end
	end

	def search
		if ""==params[:name] || " " == params[:name]
			redirect_to skills_path, :notice => "No skills matched your criteria!"
		else
			@skills = Skill.where("name ILIKE ?","%#{params[:name]}%").order(:name)
		end
	end

	private
		def skill_params
			params.require(:skill).permit(:name,:status)
		end
end

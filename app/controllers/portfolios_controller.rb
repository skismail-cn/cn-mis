class PortfoliosController < ApplicationController

	def index
		@portfolios = Portfolio.paginate(:page => params[:page])
		respond_to do |format|
	    	format.html
	    	format.csv { send_data @portfolios.as_csv }
  		end
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(protfolio_params)
		
		if project = Project.find(protfolio_params[:project_id])
			@portfolio.project_url = project_url(project)
			@portfolio.projecttype_id = project.projecttype.id
		end

		if @portfolio.save
			redirect_to @portfolio, notice: 'portfolio created successfully.'
		else
			render "new",notice: 'portfolio creation failed!!'
		end
	end

	def show
		@portfolio = Portfolio.find(params[:id])
	end

	def edit
		@portfolio = Portfolio.find(params[:id])
	end

	def update
		@portfolio = Portfolio.find(params[:id])

		if @portfolio.update(protfolio_params)
			redirect_to @portfolio , notice: 'portfolio updated successfully.'
		else
			render 'edit',notice: 'portfolio updation failed!!'
		end
		
	end

	def destroy
		@portfolio = Portfolio.find(params[:id])
		if @portfolio.destroy
			redirect_to portfolios_path, notice: 'portfolio deleted successfully.'
		else
			redirect_to portfolios_path, notice: 'portfolio deletion failed!!'
		end
	end

	def search
		if params[:projecttype]!=""
			@portfolios = Portfolio.joins(:projecttype).where("projecttypes.name LIKE '%#{params[:projecttype]}%'")
		else
			@portfolios = nil
		end
	end

	private

	def protfolio_params
		params.require(:portfolio).permit(:project_url,:project_caption,:projecttype_id,:project_id,:status)
	end
end

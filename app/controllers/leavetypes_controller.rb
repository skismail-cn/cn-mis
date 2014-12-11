class LeavetypesController < ApplicationController
  before_action :set_leavetype, only: [:show, :edit, :update, :destroy]

  # GET /leavetypes
  # GET /leavetypes.json
  def index
    @leavetypes = Leavetype.paginate(:page => params[:page])
    respond_to do |format|
        format.html
        format.csv { send_data @leavetypes.as_csv }
    end
  end

  # GET /leavetypes/1
  # GET /leavetypes/1.json
  def show
  end

  # GET /leavetypes/new
  def new
    @leavetype = Leavetype.new
  end

  # GET /leavetypes/1/edit
  def edit
  end

  # POST /leavetypes
  # POST /leavetypes.json
  def create
    @leavetype = Leavetype.new(leavetype_params)

    respond_to do |format|
      if @leavetype.save
        format.html { redirect_to @leavetype, notice: 'Leavetype was successfully created.' }
        format.json { render :show, status: :created, location: @leavetype }
      else
        format.html { render :new }
        format.json { render json: @leavetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leavetypes/1
  # PATCH/PUT /leavetypes/1.json
  def update
    respond_to do |format|
      if @leavetype.update(leavetype_params)
        format.html { redirect_to @leavetype, notice: 'Leavetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @leavetype }
      else
        format.html { render :edit }
        format.json { render json: @leavetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leavetypes/1
  # DELETE /leavetypes/1.json
  def destroy
    @leavetype.destroy
    respond_to do |format|
      format.html { redirect_to leavetypes_url, notice: 'Leavetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # SEARCH
  def search
    if ""==params[:name] || " " == params[:name]
      redirect_to leavetypes_path, :notice => "No leave types matched your criteria!"
    else
      @leavetypes = Leavetype.where("name ILIKE ?","%#{params[:name]}%").order(:name)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leavetype
      @leavetype = Leavetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def leavetype_params
      params.require(:leavetype).permit(:name, :status)
    end
end

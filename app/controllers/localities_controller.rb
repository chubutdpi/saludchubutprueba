class LocalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_locality, only: %i[ show edit update destroy ]
  load_and_authorize_resource

  # GET /localities or /localities.json
  def index
    current_uri = request.env['PATH_INFO']
    respond_to do |format|
      if !(current_uri.include? "api")
        format.html
        format.json { render json: LocalityDatatable.new(params) }
      else
        format.json
      end
    end
  end

  # GET /localities/1 or /localities/1.json
  def show
  end

  # GET /localities/new
  def new
    @locality = Locality.new
  end

  # GET /localities/1/edit
  def edit
  end

  # POST /localities or /localities.json
  def create
    @locality = Locality.new(locality_params)

    respond_to do |format|
      if @locality.save
        format.html { redirect_to locality_url(@locality), notice: "Locality was successfully created." }
        format.json { render :show, status: :created, location: @locality }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /localities/1 or /localities/1.json
  def update
    respond_to do |format|
      if @locality.update(locality_params)
        format.html { redirect_to locality_url(@locality), notice: "Locality was successfully updated." }
        format.json { render :show, status: :ok, location: @locality }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @locality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localities/1 or /localities/1.json
  def destroy
    @locality.destroy

    respond_to do |format|
      format.html { redirect_to localities_url, notice: "Locality was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locality
      @locality = Locality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def locality_params
      params.require(:locality).permit(:name, :postal_code, :area_id, :short_name, :enabled)
    end
end

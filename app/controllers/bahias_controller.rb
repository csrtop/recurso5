class BahiasController < ApplicationController
  before_action :set_bahia, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /bahias
  # GET /bahias.json
  def index
    @bahias = Bahia.where("club_id=#{current_user.club_id}")
    #@bahias = Bahia.all
  end

  # GET /bahias/1
  # GET /bahias/1.json
  def show
  end

  # GET /bahias/new
  def new
    @bahia = Bahia.new
  end

  # GET /bahias/1/edit
  def edit
  end

  # POST /bahias
  # POST /bahias.json
  def create
    @bahia = Bahia.new(bahia_params)

    respond_to do |format|
      if @bahia.save
        format.html { redirect_to bahias_path, notice: 'Bahia was successfully created.' }
        format.json { render :show, status: :created, location: @bahia }       
      else
        format.html { render :new }
        format.json { render json: @bahia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bahias/1
  # PATCH/PUT /bahias/1.json
  def update
    respond_to do |format|
      if @bahia.update(bahia_params)
        format.html { redirect_to bahias_path, notice: 'Bahia was successfully updated.' }
        format.json { render :show, status: :ok, location: @bahia }
      else
        format.html { render :edit }
        format.json { render json: @bahia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bahias/1
  # DELETE /bahias/1.json
  def destroy
    @bahia.destroy
    respond_to do |format|
      format.html { redirect_to bahias_url, notice: 'Bahia was successfully destroyed.' }
      format.json { head :no_content }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bahia
      @bahia = Bahia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bahia_params
      params.require(:bahia).permit(:bahia, :club_id)
    end
end

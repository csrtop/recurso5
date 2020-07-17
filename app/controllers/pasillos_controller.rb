class PasillosController < ApplicationController
  before_action :set_pasillo, only: [:show, :edit, :update, :destroy]

  # GET /pasillos
  # GET /pasillos.json
  def index
    @pasillos = Pasillo.where("club_id=#{current_user.club_id}")
    #@pasillos = Pasillo.all
  end

  # GET /pasillos/1
  # GET /pasillos/1.json
  def show
  end

  # GET /pasillos/new
  def new
    @pasillo = Pasillo.new
  end

  # GET /pasillos/1/edit
  def edit
  end

  # POST /pasillos
  # POST /pasillos.json
  def create
    @pasillo = Pasillo.new(pasillo_params)
    #@tarea = current_user.tareas.new(tarea_params)
    
    respond_to do |format|
      if @pasillo.save
        format.html { redirect_to pasillos_path, notice: 'Pasillo was successfully created.' }
        format.json { render :show, status: :created, location: @pasillo }
      else
        format.html { render :new }
        format.json { render json: @pasillo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pasillos/1
  # PATCH/PUT /pasillos/1.json
  def update
    respond_to do |format|
      if @pasillo.update(pasillo_params)
        format.html { redirect_to @pasillo, notice: 'Pasillo was successfully updated.' }
        format.json { render :show, status: :ok, location: @pasillo }
      else
        format.html { render :edit }
        format.json { render json: @pasillo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasillos/1
  # DELETE /pasillos/1.json
  def destroy
    @pasillo.destroy
    respond_to do |format|
      format.html { redirect_to pasillos_url, notice: 'Pasillo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pasillo
      @pasillo = Pasillo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pasillo_params
      params.require(:pasillo).permit(:pasillo, :club_id)
    end
end

class ClubesController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  # GET /clubes
  # GET /clubes.json
  def index
    @clubes = Club.all
  end

  # GET /clubes/1
  # GET /clubes/1.json
  def show
  end

  # GET /clubes/new
  def new
    @club = Club.new
  end

  # GET /clubes/1/edit
  def edit
  end

  # POST /clubes
  # POST /clubes.json
  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to clubes_path, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubes/1
  # PATCH/PUT /clubes/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to clubes_path, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubes/1
  # DELETE /clubes/1.json
  def destroy
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubes_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def club_params
      params.require(:club).permit(:no_club, :nombre)
    end
end

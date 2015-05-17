class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]
  before_action :set_honeymoon

  # GET /destinations
  # GET /destinations.json
  def index
    respond_to do |format|
      format.html { redirect_to honeymoon_path }
      format.json { @destinations = @honeymoon.destinations }
    end
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
  end

  # GET /destinations/new
  def new
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @destination = @honeymoon.destinations.new(destination_params)

    respond_to do |format|
      if @destination.save
        format.html { redirect_to honeymoon_destination_path(@destination), notice: 'Destination was successfully created.' }
        format.json { render :show, status: :created, location: @destination }
      else
        format.html { render :new }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to honeymoon_destination_path(@destination), notice: 'Destination was successfully updated.' }
        format.json { render :show, status: :ok, location: @destination }
      else
        format.html { render :edit }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to honeymoon_path, notice: 'Destination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.friendly.find(params[:id])
  end

  def set_honeymoon
    @honeymoon = Honeymoon.instance
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def destination_params
    params.require(:destination).permit(:name, :arrival_date, :departure_date)
  end
end

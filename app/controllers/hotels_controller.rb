class HotelsController < ApplicationController
  before_action :set_destination
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def create
    @hotel = @destination.build_hotel(hotel_params)

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to honeymoon_destination_hotel_path(@destination), notice: 'Hotel was successfully created.' }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to honeymoon_destination_hotel_path(@destination), notice: 'Hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to honeymoon_destination_path(@destination), notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_destination
    @destination = Destination.friendly.find(params[:destination_id])
  end

  def set_hotel
    @hotel = @destination.hotel || @destination.build_hotel
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def hotel_params
    params.require(:hotel).permit(:name, :url, :booked, :destination_id)
  end
end

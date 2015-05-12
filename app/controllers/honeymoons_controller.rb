class HoneymoonsController < ApplicationController
  before_action :set_honeymoon, only: [:show, :edit, :update, :destroy]

  def show
  end

  # GET /honeymoons/1/edit
  def edit
  end

  # PATCH/PUT /honeymoons/1
  # PATCH/PUT /honeymoons/1.json
  def update
    respond_to do |format|
      if @honeymoon.update(honeymoon_params)
        format.html { redirect_to honeymoon_path, notice: 'Honeymoon was successfully updated.' }
        format.json { render :show, status: :ok, location: @honeymoon }
      else
        format.html { render :edit }
        format.json { render json: @honeymoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /honeymoons/1
  # DELETE /honeymoons/1.json
  def destroy
    @honeymoon.destroy
    respond_to do |format|
      format.html { redirect_to honeymoon_url, notice: 'Honeymoon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_honeymoon
      @honeymoon = Honeymoon.instance
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def honeymoon_params
      params.require(:honeymoon).permit(:from, :to)
    end
end

class DaysController < ApplicationController
  require_login

  def create
    day = Day.find_or_create_by!(day_params)
    day.update!(active: true)
    respond_to do |format|
      format.json { render json: day }
    end
  end

  def destroy
    day = Day.find_by(date: params[:id])
    day&.update!(active: false)
    head :ok
  end

  private

  def day_params
    params.require(:day).permit(:date)
  end
end

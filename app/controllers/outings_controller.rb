class OutingsController < ApplicationController
  def show
    @outing = Outing.find(params[:id])
  end

  def destroy
    ContestantOuting.find_by(outing_id: params[:id], contestant_id: params[:cont_id]).destroy
    redirect_to "/outings/#{params[:id]}"
  end
end
class RidesController < ApplicationController
  def create
    @user = User.find(params[:ride][:user_id])
    @ride = Ride.new(ride_params)
    message = @ride.take_ride
    redirect_to user_path(@user), notice: message
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
  
end

class RidesController < ApplicationController

    def create
        ride = Ride.create(:attraction_id => params[:attraction_id], :user_id => current_user.id)
        attraction = Attraction.find(params[:attraction_id])
        flash[:message] = ride.take_ride
        redirect_to user_path(current_user)
    end
end
class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.where({ "user_id" => @current_user["id"] })
    else
      @places = []
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"], "user_id" => @current_user["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["id"] }) if @place
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = @current_user["id"]  # now using the cleaner helper
    @place.save
    redirect_to "/places"
  end

end

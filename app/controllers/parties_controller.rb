class PartiesController < ApplicationController

  def index
    render json: PartySerializer.new(Party.all)
  end

  def create
  end

  def show
    @party = Party.find_by_id(params[:id])
    serialized_guests = GuestSerializer.new(@party.guests)
    render json: serialized_guests
  end

  def update
  end

end

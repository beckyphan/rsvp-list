class PartiesController < ApplicationController

  def index
    serialized_parties = PartySerializer.new(Party.all)
    render json: serialized_parties
  end

  def create
    @party = Party.create(party_params)
    serialized_party = PartySerializer.new(@party)
    render json: serialized_party
  end

  def show
    @party = Party.find_by_id(params[:id])
    serialized_guests = GuestSerializer.new(@party.guests)
    render json: serialized_guests
  end

  def update
  end

  private

  def party_params
    params.require(:party).permit(:name, :hoh)
  end

end

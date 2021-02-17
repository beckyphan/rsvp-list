class PartiesController < ApplicationController

  def index
    serialized_parties = PartySerializer.new(Party.all)
    render json: serialized_parties
  end

  def show
    @party = Party.find_by_id(params[:id])
    serialized_guests = GuestSerializer.new(@party.guests)
    render json: serialized_guests
  end

  # admin only actions
  # POST	/admin/parties(.:format)
  def create
    @party = Party.create(party_params)
    serialized_party = PartySerializer.new(@party)
    render json: serialized_party
  end

  # PUT	/admin/parties/:id(.:format)
  def update
    party = Party.find_by_id(params[:id])
    party.update(party_params)
    serialized_party = PartySerializer.new(party)
    render json: serialized_party
  end

  # DELETE	/admin/parties/:id(.:format)
  def destroy
    party = Party.find_by_id(params[:id])
    party.destroy
    render json: {message: "successfully deleted"}
  end

  private

  def party_params
    params.require(:party).permit(:name, :hoh)
  end

end

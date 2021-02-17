class GuestsController < ApplicationController

  def index
    serialized_guests = GuestSerializer.new(Guest.all)
    render json: serialized_guests
  end

  def show
    if params[:id].match(/\+/)
      search_params
    else
      @guest = Guest.find_by_id(params[:id])
    end

    if !!@guest
      serialized_guest = GuestSerializer.new(@guest)
      render json: serialized_guest
    end
  end

  def update
    @guest = Guest.find_by_id(params[:id])
    @guest.update(rsvp_params)

    serialized_guest = GuestSerializer.new(@guest)
    render json: serialized_guest
  end

  # admin only actions
  # POST	/admin/guests(.:format)
  def create
    guest = Guest.create(guest_params)
    if guest.valid?
      guest.update(attending: false, shuttle: false, hotel: false, notes: "")
      serialized_guest = GuestSerializer.new(guest)
    else
      serialized_guest = {message: "Could not create guest"}
    end

    render json: serialized_guest
  end

  # PUT	/admin/guests/:id(.:format)
  # def edit
  #   binding.pry
  # end

  # DELETE	/admin/guests/:id(.:format)
  def destroy
    guest = Guest.find_by_id(params[:id])
    guest.destroy
    render json: {message: "successfully deleted"}
  end

  private

  def search_params
    name = params[:id].split('+')
    @fname = name[0].downcase
    @lname = name[1].downcase
    @guest = Guest.find_by(fname: @fname, lname: @lname)
  end

  def rsvp_params
    params.require(:guest).permit(:attending, :shuttle, :hotel, :notes)
  end

  def guest_params
    params.require(:guest).permit(:fname, :lname, :plusones, :party_id)
  end

end

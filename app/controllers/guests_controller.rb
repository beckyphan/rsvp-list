class GuestsController < ApplicationController

  def index
    binding.pry
  end

  def create
    binding.pry
  end

  def show
    search_params

    if !!@guest
      serialized_guest = GuestSerializer.new(@guest)
      render json: serialized_guest
    end
  end

  def update
    binding.pry
  end

  private

  def search_params
    name = params[:id].split('+')
    @fname = name[0].downcase
    @lname = name[1].downcase
    @guest = Guest.find_by(fname: @fname, lname: @lname)
  end

end

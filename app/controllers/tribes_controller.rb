class TribesController < ApplicationController
  def index
    @tribes = current_user.joined_tribes
  end

  def show
    @tribe = current_user.joined_tribes.find(params[:id])
  end

  def new
    @tribe = Tribe.new
  end

  def create
    @tribe      = Tribe.new(tribe_params)
    @tribe.user = current_user

    if @tribe.save
      redirect_to tribe_path(@tribe)
    else
      respond_to do |format|
        format.html { broadcast_errors @tribe, tribe_params }
        format.json { render json: @tribe.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def tribe_params
    params.require(:tribe).permit(:title)
  end
end

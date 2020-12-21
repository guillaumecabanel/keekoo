class MomentsController < ApplicationController
  before_action :set_tribe, only: [:index, :show, :new, :create]

  def index
    @moments = @tribe.moments.with_attached_picture.order(created_at: :desc)
  end

  def show
    @moment  = @tribe.moments.find(params[:id])
    @comment = Comment.new
  end

  def new
    @moment = Moment.new
  end

  def create
    @moment       = Moment.new(moment_params)
    @moment.user  = current_user
    @moment.tribe = @tribe

    if @moment.save
      redirect_to tribe_moments_path(@tribe)
    else
      respond_to do |format|
        format.html { broadcast_errors @moment, moment_params }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_tribe
    @tribe = current_user.tribes.find(params[:tribe_id])
  end

  def moment_params
    params.require(:moment).permit(:picture)
  end
end

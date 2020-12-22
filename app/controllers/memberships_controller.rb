class MembershipsController < ApplicationController
  def new
    @tribe      = Tribe.find_by!(uuid: params[:invite])

    redirect_to tribe_moments_path(@tribe) and return if current_user.joined_tribes.pluck(:id).include? @tribe.id

    @membership = Membership.new
  end

  def create
    @tribe            = Tribe.find_by!(uuid: invite)
    @membership       = Membership.new
    @membership.user  = current_user
    @membership.tribe = @tribe

    if @membership.save
      redirect_to tribe_moments_path(@tribe)
    else

    end
  end

  private

  def invite
    params.require(:membership).permit(:invite)[:invite]
  end
end

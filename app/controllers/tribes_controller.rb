class TribesController < ApplicationController
  def index
    @tribes = current_user.tribes
  end

  def show
    @tribe = current_user.tribes.find(params[:id])
  end
end

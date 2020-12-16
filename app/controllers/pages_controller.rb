class PagesController < ApplicationController
  def wait_for_confirmation
    redirect_to root_path if current_user
  end
end

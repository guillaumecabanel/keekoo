class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def wait_for_confirmation
    redirect_to root_path if current_user
  end
end

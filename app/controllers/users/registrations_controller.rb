class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?

    if resource.persisted?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length

      respond_to do |format|
        format.html { broadcast_errors resource, sign_up_params }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    wait_for_confirmation_path
  end

  def sign_up_params
    super.merge(params.require(:user).permit(:nickname))
  end
end

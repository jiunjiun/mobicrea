class Users::RegistrationsController < Devise::RegistrationsController
  layout 'admin'
  before_action :update_meta, only: [:edit]

  def update
    if current_user.update_with_password user_params
      bypass_sign_in(current_user)
      redirect_to admin_root_path, notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def update_meta
    prepare_meta_tags
  end
end

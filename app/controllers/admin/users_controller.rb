class Admin::UsersController < AdminController
  expose :users, -> { User.all.paginate(page: params[:page]) }
  expose :user

  def index
  end

  def new
  end

  def create
    if user.save
      redirect_to admin_users_path, notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def destroy
    user.destroy
    redirect_to admin_users_path, notice: t('helpers.successfully_destroy')
  end

  private
  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end

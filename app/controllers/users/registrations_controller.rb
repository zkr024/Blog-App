class Users::RegistrationsController < Devise::RegistrationsController
  def create
    user = User.new(user_params)

    if user.save
      redirect_to root_path
    else
      redirect_to new_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :email, :password, :password_confirmation)
  end
end

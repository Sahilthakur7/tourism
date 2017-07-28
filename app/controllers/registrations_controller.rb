class RegistrationsController <  Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?
    private

    # def sign_up_params
    #     params.require(:user).permit(:name,:avatar,:email,:password,:password_confirmation)
    # end

    # def account_update_params
    #     params.require(:user).permit(:name,:avatar,:email,:password,:password_confirmation,:current_password)
    # end

    def update_sanitized_params
        devise_parameter_sanitizer.for(:account_update){|u| u.permit(:avatar,:name,:current_password,:password,:password_confirmation) }
        devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:avatar,:name,:current_password,:password,:password_confirmation,:email) }
    end

end

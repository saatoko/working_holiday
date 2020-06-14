# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super do
      if request.format.json?
        render :json => {
          'status' => 'ok',
          'csrf_token' => form_authenticity_token,
          'result' => {
            'user' => {
              'id' => @user.id,
              'nickname' => @user.nickname
              'age_id' => @user.age_id
              'profession_id' => @user.profession_id
              'gender_id' => @user.gender_id
              'profile' => @user.profile
              'situation' => @user.situation
              'country' => @user.country
              'experience_country' => @user.experience_country
              'duration' => @user.duration
            }
          }
        } and return
      end
    end
  end
  
  def destroy
    super do
      if request.format.json?
        render :json => {
          'csrf_param' => request_forgery_protection_token,
          'csrf_token' => form_authenticity_token
        }
        return
      end
    end
  end
end


  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
# end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :age_id,
      :profession_id,
      :gender_id,
      :password,
      :profile,
      :situation,
      :country,
      :experience_country
      :duration
    )
  end
end

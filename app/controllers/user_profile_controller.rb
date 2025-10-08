class UserProfileController < ApplicationController
  def user_profile
    @user = User.find(params[:id])
  end
end

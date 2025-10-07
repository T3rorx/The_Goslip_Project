class UserProfileController < ApplicationController
  def user_profile
    puts "$" * 27
    puts "User Profile URL: /user/#{params[:id]}"
    puts "$" * 27
  end
end

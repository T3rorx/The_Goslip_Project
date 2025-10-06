class HomeController < ApplicationController 
  def ask
  end
  def go 
    user_id = params[:id].presence || params [:user_id]
    if user_id.blank?
      flash.now[:alert] = "merci d'entrer un ID."
      render :ask
    else 
      redirect_to user_path(user_id)
    end
  end
end
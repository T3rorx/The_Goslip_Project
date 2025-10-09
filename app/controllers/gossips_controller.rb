class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(gossip_params)
    @gossip.user = User.find_by(id: session[:user_id])
    @gossip.tag_id = 1

    if @gossip.save
      redirect_to root_path, notice: "Le potin a été créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @model = Gossip.find(params[:id])
      if @model.update(gossip_params)
      redirect_to @model
      else
      render :edit
      end
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content, :user_id,:tag )
  end
end

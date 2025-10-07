class PagesController < ApplicationController
  def team
  end
  def home
    @gossips = Gossip.all
  end
  def contact
  end
end

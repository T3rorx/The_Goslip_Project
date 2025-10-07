class GossipController < ApplicationController
  def gossip
    puts "$" * 27
    puts "Gossip URL: /gossip/#{params[:id]}"
    puts "$" * 27
  end
end

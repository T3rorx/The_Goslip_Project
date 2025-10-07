class PotinController < ApplicationController
  def pagedepotin
    puts "$" * 27
    puts "Voici le message de l'URL :"
    puts params[:id]
    puts "$" * 27
  end
end

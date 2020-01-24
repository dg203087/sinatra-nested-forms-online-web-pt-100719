require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end
    
    get '/new' do
      erb :pirates/new
    end
    
    post '/pirates' do
      @pirate = Pirate.new(name: params[:pirate][:name], height: params[:pirate][:height],  weight: [:pirate][:weight])
      
      ships = params[:pirate][:ships]
      ships.each do |ship_details|
          Ship.new({name: ship_details[:name], type: ship_details[:type], booty: ship_details[:booty]})
      end
      
      @ships = Ship.all
      
      erb :pirates/show
    end 
  end
end

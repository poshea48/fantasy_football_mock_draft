require 'rest-client'
require 'json'
require 'pry'

class PlayersController < ApplicationController
  before_action :set_pick_number
  #  sskip_before_action :verify_authenticity_token, :only => [:update_pick_number]


  def index
    if Player.all.empty?
      get_players
    end
    # @players = Player.sorted.paginate(page: params[:page], per_page: 20)
    @players = Player.sorted 
  end

  def update_pick_number
    binding.pry
    if params[:pick_number] && (params[:pick_number] > 0 && params[:pick_number] <= 10)
      session[:picks] = helpers.get_all_pick_numbers(params[:pick_number].to_i)
    end
    redirect_to root_path
  end

  def show
  end

  def update
    @player = Player.find(params[:id])
    if params[:my_player]
      @player.update(drafted: true, my_player: true)
      round_drafted = MyPlayer.all.empty? ? 1 : MyPlayer.last.round_drafted.to_i + 1
      starter = MyPlayer.need_starter?(@player.position)
      MyPlayer.create({ player_id: @player.id,
                        position: @player.position,
                        starter: starter,
                        round_drafted: round_drafted })
    else
      @player.update(drafted: true)
    end
    # redirect_to root_path
  end

  def new
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to root_path
  end

  private
    def player_params
      params.require(:player).permit(:drafted, :my_player)
    end

    def set_pick_number
      @picks = session[:picks] || helpers.get_all_pick_numbers(9)
    end

    def get_players
      url = "https://fantasyfootballcalculator.com/api/v1/adp/standard?teams=12&year=2018"
      response = RestClient.get(url)
      players = JSON.parse(response)
      players["players"].each do |player|
        Player.create({ name: player["name"],
                        adp: player["adp"].to_f,
                        team: player["team"],
                        position: player["position"],
                        bye: player["bye"]})
      end
    end
end

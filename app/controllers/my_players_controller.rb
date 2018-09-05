require 'pry'
class MyPlayersController < ApplicationController
  before_action :set_starters, only: [:index]

  def index
  end

  def create
    player = Player.find_by_id(params[:player_id])
    round_drafted = MyPlayer.all.empty? ? 1 : MyPlayer.last.round_drafted.to_i + 1
    binding.pry
    MyPlayer.create({ player_id: player.id,
                      position: player.position,
                      round_drafted: round_drafted,
                      starter: make_starter?(player.position)
                    })
    redirect_to root_path
  end

  def show
  end

  private

    def set_starters
      @starters = MyPlayer.starters
      all_rbs = @starters.select{|p| p.position == "RB"}
      all_wrs = @starters.select{|p| p.position == "WR"}

      @qb = @starters.select{|p| p.position == "QB"}
      @rbs = all_rbs.shift(2)
      @wrs = all_wrs.shift(2)
      @rbs_wrs = all_rbs.concat(all_wrs)
      @def = @starters.select{|p| p.position == "DEF"}
      @kicker = @starters.select{|p| p.position == "PK"}
      @bench = MyPlayer.back_ups
    end
end

    # def make_starter?(position)
    #   if (position == "QB" && @qb.nil?) ||
    #      (position == "DEF" && @def.nil?) ||
    #      (position == "PK" && @kicker.nil?)
    #     return true
    #   elsif position == "RB"
    #     if (@rbs.nil?) ||
    #        (@rbs.size < 2) ||
    #        (@rbs.size == 2 && @rbs_wrs.nil?) ||
    #        (@rbs.size == 2 && @rbs_wrs.size < 2)
    #       return true
    #     end
    #   elsif position == "WR"
    #     if (@wrs.nil?) ||
    #        (@wrs.size < 2) ||
    #        (@wrs.size == 2 && @rbs_wrs.nil?) ||
    #        (@wrs.size == 2 && @rbs_wrs.size < 2)
    #       return true
    #     end
    #   else
    #     return false
    #   end
    # end
    #
    # # def get_rb_wr_starters
    # #   rbs_wrs = MyPlayers.where(["position=? OR postion=?", "RB", "WR"])
    # #   rbs_wrs.select{ |p| p.}
    # # end
    # # def set_linup
    # #   @starters = []
    # #   @bench = []
    # #   MyPlayer.all.each do |player|
    # #     need_starter?(pos, @starters) ? @starters << player : @bench << player
    # #   end
    # # end
    # #
    # # def need_starter?(pos, group)
    # #   starters_at_postion = group.select{ |p| p.position == pos }.size
    # #   if pos == "QB" || "DEF" || "PK"
    # #     return starters_at_position < 1
    # #   else
    # #     return starters_at_postion < 2
    # #   end
    # # end

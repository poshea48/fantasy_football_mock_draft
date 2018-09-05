module PlayersHelper
  def get_all_pick_numbers(first_pick)
    current_pick = first_pick
    picks = [first_pick]
    (2..16).each do |n|
      if n.even?
        current_pick += ((10 - first_pick) * 2 + 1)
        picks << current_pick
      else
        current_pick += (first_pick * 2) - 1
        picks << current_pick
      end
    end
    return picks
  end
end

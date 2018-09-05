class MyPlayer < ApplicationRecord

  scope :starters, lambda { where(["starter=?", "1"]) }
  scope :back_ups, lambda { where(["starter=?", "0"]) }
  scope :find_starters, lambda { |pos| where(["starter=? and position=?", "1", "#{pos}"])}

  def self.find_starters(position)
    starters = where(["starter=? and position=?", "1", "#{position}"])
  end

  def self.need_starter?(position)
    starters = self.find_starters(position)
    if position == "RB"
      if starters.size < 2
        return true
      elsif self.make_rb_wr_starter?(position)
        return true
      else
        return false
      end
    elsif position == "WR"
      if starters.size < 2
        return true
      elsif self.make_rb_wr_starter?(position)
        return true
      else
        return false
      end
    else
      return starters.size == 0 ? true : false
    end
  end

  def self.make_rb_wr_starter?(pos)
    rbs = self.find_starters("RB")
    wrs = self.find_starters("WR")
    if rbs.size + wrs.size == 6
      return false
    end

    if rbs.size == 4 || wrs.size == 4
      return false
    end

    if pos == "RB"
      if (rbs.size == 2 || rbs.size == 3) && wrs.size <= 2
        return true
      else
        return false
      end
    elsif pos == "WR"
      if (wrs.size == 2 || wrs.size == 3) && rbs.size <= 2
        return true
      else
        return false
      end
    else
      return false
    end
  end
end

#     if rbs.size == 2 && wrs.size == 2
#       return true
#     elsif rbs.size == 2
#
#     elsif rbs.size == 3 && wrs.size <= 2
#       return true
#     elsif wrs.size == 3 && rbs.size <= 2
#       return true
#     else
#       return false
#     end
#   end
#     if rbs.size < 4 && wrs.size < 2
#       return true
#     elsif wrs.size < 4 && rbs.size < 2
#       return true
#
#     elsif rbs.size == 3 && wrs.size < 3
#       return true
#     elsif wrs.size == 3 && rbs.size < 3
#       return true
#     else
#       return false
#     end
#   end
#
#     if rbs.size < 2 || wrs.size < 2
#       return true
#     if rbs.size >= 2 && ((rbs.size + wrs.size) < 4)
#
#     if rbs.size + wrs.size == 6
#       return false
#
#     if rbs.size == 3 && wrs.size < 3 || wrs.size == 3 && rbs.size < 3
#       return true
#     elsif
#       return true
#
#     where(["starter=? and position=? or position=?", "true", "RB", "WR"])
#   end
# end

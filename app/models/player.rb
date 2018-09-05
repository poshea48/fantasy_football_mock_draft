class Player < ApplicationRecord
  scope :sorted, lambda { order("adp ASC") }
end

class Gaisan < ActiveRecord::Base
  attr_accessor :kosuu

  def shikomiryou
    kosuu*2
  end

end

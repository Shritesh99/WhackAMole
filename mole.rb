require 'gosu'

class Mole < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Wack a Mole"
    @image = Gosu::Image.new('media/mole.png')
    @x = 200
    @y = 200
    @width = 100
    @hieght = 75
    @velocity_x = 1
    @velocity_y = 1
  end
  def draw
    @image.draw(@x - @width / 2,@y - @hieght / 2, 1)
  end
  def update
    @x += @velocity_x
    @velocity_x *= -1 if @x + @width / 2 > 800 || @x + @width / 2 < 0
    @y += @velocity_y
    @velocity_y *= -1 if @y + @hieght / 2 > 600 || @y + @hieght / 2 < 0
  end
end
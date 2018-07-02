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
    @velocity_x = 5
    @velocity_y = 5
    @visible = 0
  end
  def draw
    if @visible > 0
       @image.draw(@x - @width / 2,@y - @hieght / 2, 1)
    end
  end
  def update
    @x += @velocity_x
    @velocity_x *= -1 if @x + @width / 2 > 800 || @x + @width / 2 < 0
    @y += @velocity_y
    @velocity_y *= -1 if @y + @hieght / 2 > 600 || @y + @hieght / 2 < 0
    @visible -= 1
    @visible = 30 if @visible < -10 && rand < 0.01
  end
end
require 'gosu'

class Mole < Gosu::Window
  def initialize
    super(800, 600)
    self.caption = "Wack a Mole"
    @image = Gosu::Image.new('media/mole.png')
    @hammer = Gosu::Image.new('media/hammer.png')
    @x = 200
    @y = 200
    @width = 100
    @hieght = 75
    @velocity_x = 5
    @velocity_y = 5
    @visible = 0
    @hit = 0
    @font = Gosu::Font.new(30)
    @score = 0
    @playing = true
  end
  def draw
    if @visible > 0
       @image.draw(@x - @width / 2,@y - @hieght / 2, 1)
    end
    @hammer.draw(mouse_x - 25, mouse_y - 25, 1)
    if @hit == 0
      c = Gosu::Color::NONE
    elsif @hit == 1
      c = Gosu::Color::GREEN
    elsif @hit == -1
      c = Gosu::Color::RED
    end
    draw_quad(0,0,c,800,0,c,800,600,c,0,600,c)
    @hit = 0
    @font.draw(@score.to_s, 650, 50, 2)
    @font.draw(@time_left.to_s, 50, 50, 2)
    if !@playing
      @font.draw("Game Over!!", 300, 300, 3)
      @visible = 20
      @time_left = 0
    end
  end
  def update
   if @playing
     @x += @velocity_x
     @velocity_x *= -1 if @x + @width / 2 > 800 || @x + @width / 2 < 0
     @y += @velocity_y
     @velocity_y *= -1 if @y + @hieght / 2 > 600 || @y + @hieght / 2 < 0
     @visible -= 1
     @visible = 50 if @visible < -10 && rand < 0.01
     @time_left = (60 - (Gosu.milliseconds / 1000))
     @playing = false if @time_left < 1
   end
  end
  def button_down(id)
    if @playing
      if(id == Gosu::MsLeft)
        if Gosu.distance(mouse_x, mouse_y, @x, @y) < 50 && @visible >= 0
          @hit = 1
          @score += 10
        else
          @hit = -1
          @score -= 3
        end
      end
    end
  end
end
class ViewPong
  def initialize(ball_gateway:, pitch_gateway:)
    @ball_gateway = ball_gateway
    @pitch_gateway = pitch_gateway
  end

  def execute(*)
    pitch = @pitch_gateway.fetch
    ball = @ball_gateway.fetch

    {
      dimensions: {
        width: pitch.width,
        height: pitch.height
      },
      ball: {
        x: ball.x,
        y: ball.y
      }
    }
  end
end

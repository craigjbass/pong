class ViewPong
  def initialize(ball_gateway:, pitch_gateway:)
    @ball_gateway = ball_gateway
    @pitch_gateway = pitch_gateway
  end

  def execute(*)
    {
      dimensions: {
        x: @pitch_gateway.fetch.width,
        y: @pitch_gateway.fetch.height
      }
    }
  end
end

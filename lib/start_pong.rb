class StartPong
  def initialize(ball_gateway:, pitch_gateway:)
    @ball_gateway = ball_gateway
    @pitch_gateway = pitch_gateway
  end
  RATIO_16_9 = {
    ratio_width: 16,
    ratio_height: 9
  }.freeze

  def execute(width:)
    @pitch = Pitch.with_aspect_ratio(width, RATIO_16_9)
    @ball_gateway.save(
      ball_at_starting_position
    )
    @pitch_gateway.save(@pitch)

    {}
  end

  private

  def ball_at_starting_position
    ball = Ball.new
    ball.x = @pitch.width / 2
    ball.y = @pitch.height / 3
    ball
  end
end

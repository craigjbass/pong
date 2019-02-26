describe ViewPong do
  def execute(ball, pitch)
    view_pong = ViewPong.new(
      pitch_gateway: double(fetch: pitch),
      ball_gateway: double(fetch: ball)
    )
    view_pong.execute({})
  end

  it 'can view dimensions' do
    response = execute(
      Ball.new,
      Pitch.new(width: 9, height: 10)
    )

    expect(response[:dimensions][:width]).to eq(9)
    expect(response[:dimensions][:height]).to eq(10)
  end

  it 'can view dimensions (example 2)' do
    response = execute(
      Ball.new,
      Pitch.new(width: 24, height: 15)
    )

    expect(response[:dimensions][:width]).to eq(24)
    expect(response[:dimensions][:height]).to eq(15)
  end

  it 'can view ball coordinates' do
    response = execute(
      Ball.new.tap do |ball|
        ball.x = 1
        ball.y = 2
      end,
      Pitch.new(width: 24, height: 15)
    )

    expect(response[:ball][:x]).to eq(1)
    expect(response[:ball][:y]).to eq(2)
  end

  it 'can view ball coordinates' do
    response = execute(
      Ball.new.tap do |ball|
        ball.x = 10
        ball.y = 20
      end,
      Pitch.new(width: 24, height: 15)
    )

    expect(response[:ball][:x]).to eq(10)
    expect(response[:ball][:y]).to eq(20)
  end
end

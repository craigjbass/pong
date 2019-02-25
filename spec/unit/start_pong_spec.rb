describe StartPong do
  let(:ball_gateway) { spy }
  let(:pitch_gateway) { spy }
  let(:start_pong) do
    StartPong.new(ball_gateway: ball_gateway, pitch_gateway: pitch_gateway)
  end

  def ball_is_at(x:, y:)
    expect(ball_gateway).to have_received(:save) do |ball|
      expect(ball.x).to eq(x)
      expect(ball.y).to eq(y)
    end
  end

  it 'can respond with empty hash' do
    expect(start_pong.execute(width: 1000)).to eq({})
  end

  it 'can place the ball in start position' do
    start_pong.execute(width: 1000)
    ball_is_at(x: 500, y: 187.5)
  end

  it 'can place the ball in start position (example 2)' do
    start_pong.execute(width: 100)
    ball_is_at(x: 50, y: 18.75)
  end

  it 'can place the ball in start position (example 3)' do
    start_pong.execute(width: 11)
    ball_is_at(x: 5.5, y: 2.0625)
  end

  it 'can create the pitch' do
    start_pong.execute(width: 11)
    expect(pitch_gateway).to have_received(:save) do |pitch|
      expect(pitch.width).to eq(11)
      expect(pitch.height).to eq(6.1875)
    end
  end

  it 'can create the pitch (example 2)' do
    start_pong.execute(width: 16)
    expect(pitch_gateway).to have_received(:save) do |pitch|
      expect(pitch.width).to eq(16)
      expect(pitch.height).to eq(9)
    end
  end
end

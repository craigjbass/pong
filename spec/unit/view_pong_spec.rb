describe ViewPong do
  it 'can view dimensions' do
    pitch_gateway = double(fetch: Pitch.new(width: 9, height: 10))

    view_pong = ViewPong.new(pitch_gateway: pitch_gateway, ball_gateway: nil)
    response = view_pong.execute({})

    expect(response[:dimensions][:x]).to eq(9)
    expect(response[:dimensions][:y]).to eq(10)
  end

  it 'can view dimensions (example 2)' do
    pitch_gateway = double(fetch: Pitch.new(width: 24, height: 15))

    view_pong = ViewPong.new(pitch_gateway: pitch_gateway, ball_gateway: nil)
    response = view_pong.execute({})

    expect(response[:dimensions][:x]).to eq(24)
    expect(response[:dimensions][:y]).to eq(15)
  end
end

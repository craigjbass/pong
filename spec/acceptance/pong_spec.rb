require 'start_pong'
require 'view_pong'

describe 'pong' do
  class InMemoryPitchGateway
    def fetch
      @pitch.dup
    end

    def save(pitch)
      @pitch = pitch
    end
  end

  class InMemoryBallGateway
    def save(ball)

    end
  end

  it 'can render first frame in 16:9 dimensions' do
    ball_gateway = InMemoryBallGateway.new
    pitch_gateway = InMemoryPitchGateway.new
    start_pong = StartPong.new(ball_gateway: ball_gateway, pitch_gateway: pitch_gateway)
    view_pong = ViewPong.new(ball_gateway: ball_gateway, pitch_gateway: pitch_gateway)

    start_pong.execute(width: 500)

    response = view_pong.execute({})

    expect(response[:dimensions][:height]).to eq(281.25)
    expect(response[:dimensions][:width]).to eq(500)

    expect(response[:ball][:x]).to eq(250)
    expect(response[:ball][:y]).to eq(93.66)
  end
end

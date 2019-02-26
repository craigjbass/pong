require 'start_pong'
require 'view_pong'
require 'advance_time'

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
      @ball = ball
    end

    def fetch
      @ball
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
    expect(response[:ball][:y]).to eq(93.75)
  end

  it 'can render second frame in 16:9 dimensions' do
    ball_gateway = InMemoryBallGateway.new
    pitch_gateway = InMemoryPitchGateway.new
    start_pong = StartPong.new(ball_gateway: ball_gateway, pitch_gateway: pitch_gateway)
    view_pong = ViewPong.new(ball_gateway: ball_gateway, pitch_gateway: pitch_gateway)

    advance_time = AdvanceTime.new(ball_gateway: ball_gateway)

    start_pong.execute(width: 500)

    advance_time.execute({})

    response = view_pong.execute({})

    # >.< - y = (-0.375*x) + 187.5
    # dy/dx
    expect(response[:ball][:x]).to eq(249)
    expect(response[:ball][:y]).to eq(94.125)
  end
end

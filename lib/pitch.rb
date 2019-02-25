class Pitch
  attr_reader :width, :height

  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def self.with_aspect_ratio(width, ratio_width: 16, ratio_height: 9)
    Pitch.new(
      width: width.to_f,
      height: (width.to_f / ratio_width) * ratio_height
    )
  end
end

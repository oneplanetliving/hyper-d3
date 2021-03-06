module D3
  class ContinuousScale
    include D3::Native
    def call(t)
      @native.call(t)
    end

    aliases_native %i[invert ticks tickFormat]
    attributes_d3 %i[domain range rangeRound clamp]
    alias_native_chainable :nice
    alias_native_new :copy

    def interpolate(&block)
      if block
        @native.JS.interpolate(block)
        self
      else
        @native.JS.interpolate
      end
    end
  end

  class PowScale < ContinuousScale
    attribute_d3 :exponent
  end

  class LogScale < ContinuousScale
    attribute_d3 :base
  end

  class << self
    def scale_pow
      D3::PowScale.new @d3.JS.scalePow
    end

    def scale_sqrt
      D3::PowScale.new @d3.JS.scaleSqrt
    end

    def scale_linear
      D3::ContinuousScale.new @d3.JS.scaleLinear
    end

    def scale_log
      D3::LogScale.new @d3.JS.scaleLog
    end

    def scale_identity
      D3::ContinuousScale.new @d3.JS.scaleIdentity
    end

    def scale_time
      D3::ContinuousScale.new @d3.JS.scaleTime
    end

    def scale_utc
      D3::ContinuousScale.new @d3.JS.scaleUtc
    end
  end
end

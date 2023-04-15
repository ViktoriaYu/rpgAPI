
class Status
  attr_reader :duration, :func
  def initialize(duration, func)
    @duration = duration
    @func = func
  end

  def tic(target, cur)
    @func.call(target, cur, @duration)
  end
end

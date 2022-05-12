class AssemblyLine
  BASIC_PRODUCTION_BY_HOUR = 221
  HIGH_RATE = 0.9
  MEDIUM_RATE = 0.8
  LOW_RATE = 0.77

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    case @speed
    when 10
      (BASIC_PRODUCTION_BY_HOUR * @speed * LOW_RATE).to_f
    when 9
      (BASIC_PRODUCTION_BY_HOUR * @speed * MEDIUM_RATE).to_f
    when 5..8
      (BASIC_PRODUCTION_BY_HOUR * @speed * HIGH_RATE).to_f
    else
      (BASIC_PRODUCTION_BY_HOUR * @speed).to_f
    end
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end

class LogLineParser
  def initialize(line)
    @line = line
  end

  def breakdown
    @line.match /\[(?<level>.+)\]\:(?<message>.+)/
  end

  def message
    breakdown[:message].strip
  end

  def log_level
    breakdown[:level].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

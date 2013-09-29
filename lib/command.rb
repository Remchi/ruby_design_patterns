class Computer
  attr_reader :queue

  def initialize
    @queue = []
  end

  def add(command)
    @queue << command
  end

  def execute
    queue.inject("\n") { |result, command| result + command.execute + "\n"}
  end
end


class AmplifyShieldCommand
  def execute
    "Amplified Plutonium-Gamma Shield"
  end
end

class CalibrateDriverCommand
  def execute
    "Calibrated Uranium-Rod Driver"
  end
end

class TestComplierCommand
  def execute
    "Tested Jupiter Wave Complier"
  end
end

class InstallRegulatorCommand
  def execute
    "Installed Hydroelectric Magnetosphere Regulator"
  end
end
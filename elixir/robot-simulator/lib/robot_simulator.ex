defmodule RobotSimulator do
  defmodule Robot, do: defstruct [:position, :direction]

  @left %{north: :west, west: :south, south: :east, east: :north}
  @right %{north: :east, west: :north, south: :west, east: :south}
  @advance %{north: {0, 1}, east: {1, 0}, south: {0, -1}, west: {-1, 0}}

  defguardp is_direction(direction) when direction in [:north, :east, :south, :west]
  defguardp is_position(position) when is_tuple(position) and
                                       tuple_size(position) == 2 and
                                       is_integer(elem(position, 0)) and
                                       is_integer(elem(position, 1))
  defguardp is_instruction(instruction) when instruction in ["A", "L", "R"]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, _) when not is_direction(direction), do: {:error, "invalid direction"}
  def create(_, position) when not is_position(position), do: {:error, "invalid position"}
  def create(direction, position), do: %Robot{direction: direction, position: position}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions = String.graphemes(instructions)
    if Enum.all?(instructions, &is_instruction?/1) do
      Enum.reduce(instructions, robot, &move/2)
    else
      {:error, "invalid instruction"}
    end
  end

  defp is_instruction?(instruction) do
    is_instruction(instruction)
  end

  defp move("A", robot) do
    {x0, y0} = robot.position
    {x, y} = @advance[robot.direction]
    %Robot{direction: robot.direction, position: {x0 + x, y0 + y}}
  end
  defp move("L", robot), do: %Robot{direction: @left[robot.direction], position: robot.position}
  defp move("R", robot), do: %Robot{direction: @right[robot.direction], position: robot.position}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end

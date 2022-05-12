defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()

  @roman_conversions %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M",
  }

  @key_numbers Map.keys(@roman_conversions) |> Enum.sort(&(&1 > &2))

  def numeral(number) do
    convert(number, @key_numbers, "")
  end

  defp convert(0, _, result) do
    result
  end

  defp convert(number, [max | rest] = keys, result) do
    if number >= max do
      convert(number - max, keys, result <> @roman_conversions[max])
    else
      convert(number, rest, result)
    end
  end
end

defmodule Bob do
  def hey(input) do
    phrase = String.trim(input)
    cond do
      yelling?(phrase) and questionning?(phrase) -> "Calm down, I know what I'm doing!"
      yelling?(phrase) -> "Whoa, chill out!"
      questionning?(phrase) -> "Sure."
      "" == phrase -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end

  defp yelling?(phrase) do
    phrase == String.upcase(phrase) and Regex.match?(~r/[[:alpha:]]/u, phrase)
  end

  defp questionning?(phrase) do
    String.ends_with?(phrase, "?")
  end
end

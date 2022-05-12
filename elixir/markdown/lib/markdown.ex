defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  # use pipe + rename variable for readability
  def parse(text) do
    text
    |> String.split("\n")
    |> Enum.map(&process/1)
    |> Enum.join
    |> enclose_list
  end

  defp process("#" <> _ = sentence), do: sentence |> parse_header
  defp process("*" <> _ = sentence), do: sentence |> parse_list
  defp process(sentence),            do: sentence |> parse_paragraph

  def parse_header(sentence) do
    [sharps | words] = String.split(sentence)
    level = String.length(sharps)
    content = Enum.join(words, " ")
    "<h#{level}>#{content}</h#{level}>"
  end

  defp parse_list(sentence) do
    content = sentence
    |> String.trim_leading("* ")
    |> String.split
    |> Enum.map_join(" ", &replace_md_with_tag/1)
    "<li>#{content}</li>"
  end

  defp parse_paragraph(sentence) do
    content = sentence
    |> String.split
    |> Enum.map_join(" ", &replace_md_with_tag/1)
    "<p>#{content}</p>"
  end

  defp replace_md_with_tag(word) do
    word
    |> replace_prefix
    |> replace_suffix
  end

  defp replace_prefix(word) do
    # use existing methods instead of regex
    word
    |> String.replace_prefix("__", "<strong>")
    |> String.replace_prefix("_", "<em>")
  end

  defp replace_suffix(word) do
    # use existing methods instead of regex
    word
    |> String.replace_suffix("__", "</strong>")
    |> String.replace_suffix("_", "</em>")
  end

  defp enclose_list(text) do
    text
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end

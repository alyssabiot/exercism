defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]

  @transcriptions %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}
  
  def to_rna(dna) do
    Enum.map(dna, fn char ->
      Map.get(@transcriptions, char)
    end)
  end
end

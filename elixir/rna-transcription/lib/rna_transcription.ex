defmodule RnaTranscription do
  @nucleotide_complements %{
    ?G => ?C,
    ?C => ?G,
    ?T => ?A,
    ?A => ?U
  }

  def fetch_nucleotide_complement(nucleotide) do
    Map.fetch!(@nucleotide_complements, nucleotide)
  end

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&fetch_nucleotide_complement/1)
  end
end

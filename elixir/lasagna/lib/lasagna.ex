defmodule Lasagna do
  @doc """
  Returns how many minutes the lasagna should be in the oven.
  """
  @spec expected_minutes_in_oven :: Integer.t()
  def expected_minutes_in_oven(), do: 40

  @doc """
  Takes the actual minutes the lasagna has been in the oven as an argument and
  returns how many minutes the lasagna still has to remain in the oven.
  """
  @spec remaining_minutes_in_oven(integer) :: Integer.t()
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  @doc """
  Takes the number of layers you added to the lasagna as an argument and returns how many
  minutes you spent preparing the lasagna.
  """
  @spec preparation_time_in_minutes(integer) :: Integer.t()
  def preparation_time_in_minutes(num_layers) do
    num_layers * 2
  end

  @doc """
  Takes two arguments:
  1. The number of layers you added to the lasagna.
  2. The number of minutes the lasagna has been in the oven.
  Returns how many minutes in total you've worked on cooking the lasagna.
  """
  @spec total_time_in_minutes(integer, integer) :: Integer.t()
  def total_time_in_minutes(num_layers, minutes) do
    preparation_time_in_minutes(num_layers) + minutes
  end

  @doc """
  Returns a message indicating that the lasagna is ready to eat.
  """
  @spec alarm :: String.t()
  def alarm(), do: "Ding!"
end

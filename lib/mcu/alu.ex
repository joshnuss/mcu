defmodule MCU.ALU do
  import Bitwise

  @moduledoc """
  Arithmetic logic unit
  """

  @add 0b0000

  @type op_code :: <<_::4>>

  @spec compute(op_code, byte, byte) :: byte
  @doc """
  Computes 2 input bytes `a` and `b` based on 4-bit `op_code` and returns a `byte`.

  ## Examples

      iex> alias MCU.ALU
      iex> ALU.compute(0b0000, 4, 7) # add
      4
  """
  def compute(@add, a, b) do
    band(a, b)
  end
end

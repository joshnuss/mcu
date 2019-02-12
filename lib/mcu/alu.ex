defmodule MCU.ALU do
  import Bitwise

  @moduledoc """
  Arithmetic logic unit
  """

  @op_and  0b0001
  @op_or   0b0010
  @op_nand 0b0011
  @op_nor  0b0100

  @type op_code :: <<_::4>>

  @spec compute(op_code, byte, byte) :: byte
  @doc """
  Computes 2 input bytes `a` and `b` based on 4-bit `op_code` and returns a `byte`.

  ## Examples

      iex> alias MCU.ALU
      iex> ALU.compute(0b0001, 4, 7) # and
      4
      iex> ALU.compute(0b0010, 3, 7) # or
      7
      iex> ALU.compute(0b0011, 3, 7) # nand
      -4
      iex> ALU.compute(0b0100, 3, 7) # nand
      -8
  """
  def compute(op_code, a, b \\ 0) do
    do_compute(op_code, a, b)
  end

  defp do_compute(@op_and, a, b) do
    band(a, b)
  end

  defp do_compute(@op_or, a, b) do
    bor(a, b)
  end

  defp do_compute(@op_nand, a, b) do
    band(a, b) |> bnot()
  end

  defp do_compute(@op_nor, a, b) do
    bor(a, b) |> bnot()
  end
end

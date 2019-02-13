defmodule MCU.ALU do
  import Bitwise

  @moduledoc """
  Arithmetic logic unit simulation. [More info](https://en.wikipedia.org/wiki/Arithmetic_logic_unit)
  """

  @op_not 0b0000
  @op_and 0b0001
  @op_or 0b0010
  @op_nand 0b0011
  @op_nor 0b0100
  @op_xor 0b0101
  @op_shift_left 0b0110
  @op_shift_right 0b0111
  @op_add 0b1000
  @op_subtract 0b1001

  @type op_code :: <<_::4>>

  @spec compute(op_code, byte, byte) :: byte
  @doc """
  Computes 2 input bytes `a` and `b` based on 4-bit `op_code` and returns a `byte`.

  ## Examples

      iex> alias MCU.ALU
      iex> ALU.compute(0b0000, 4) # not
      -5
      iex> ALU.compute(0b0001, 4, 7) # and
      4
      iex> ALU.compute(0b0010, 3, 7) # or
      7
      iex> ALU.compute(0b0011, 3, 7) # nand
      -4
      iex> ALU.compute(0b0100, 3, 7) # nor
      -8
      iex> ALU.compute(0b0101, 3, 7) # xor
      4
      iex> ALU.compute(0b0110, 7) # shift left
      14
      iex> ALU.compute(0b0111, 5) # shift right
      2
      iex> ALU.compute(0b1000, 5, 2) # add
      7
      iex> ALU.compute(0b1001, 5, 2) # subtract
      3
  """
  def compute(op_code, a, b \\ 0) do
    do_compute(op_code, a, b)
  end

  defp do_compute(@op_not, a, _b) do
    bnot(a)
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

  defp do_compute(@op_xor, a, b) do
    bxor(a, b)
  end

  defp do_compute(@op_shift_left, a, _b) do
    a <<< 1
  end

  defp do_compute(@op_shift_right, a, _b) do
    a >>> 1
  end

  defp do_compute(@op_add, a, b) do
    a + b
  end

  defp do_compute(@op_subtract, a, b) do
    a - b
  end
end

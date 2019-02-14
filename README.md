# MCU

**TODO: Add description**

## ALU

The Arithmetic Logic Unit is 8 bits wide. It has 3 inputs: a 4-bit op code and 2x 8-bit inputs called `a` & `b`. It has 1 8-bit output called `y`.

Supported op codes:

| Op Code | Value | Description |
| ------- | ----- |------------ |
| NOT  | `0b0000` | `not a` |
| AND  | `0b0001` | `a and b` |
| OR   | `0b0010` | `a or b` |
| NAND | `0b0011` | `a nand b` |
| NOR  | `0b0100` | `a nor b` |
| XOR  | `0b0101` | `a xor b` |
| SHIFT_LEFT | `0b0110` | `a << 1` |
| SHIFT_RIGHT | `0b0111` | `a << 1` |
| ADD  | `0b1000` | `a + b` |
| SUB  | `0b1001` | `a - b` |
| EQ   | `0b1010` | `a = b` |

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mcu` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mcu, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mcu](https://hexdocs.pm/mcu).


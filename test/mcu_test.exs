defmodule MCUTest do
  use ExUnit.Case
  doctest MCU

  test "greets the world" do
    assert MCU.hello() == :world
  end
end

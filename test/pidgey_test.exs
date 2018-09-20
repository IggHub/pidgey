defmodule PidgeyTest do
  use ExUnit.Case
  doctest Pidgey

  test "greets the world" do
    assert Pidgey.hello() == :world
  end
end

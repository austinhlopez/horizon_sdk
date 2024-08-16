defmodule HorizonSdkTest do
  use ExUnit.Case
  doctest HorizonSdk

  test "greets the world" do
    assert HorizonSdk.hello() == :world
  end
end

defmodule HorizonSdkTest do
  use ExUnit.Case
  doctest HorizonSdk
  alias ExJsonSchema.Schema

  test "schemas are valid" do
    layer_schema_path = Path.join([File.cwd!(), "json_schemas", "layer_schema.json"])
    space_schema_path = Path.join([File.cwd!(), "json_schemas", "space_schema.json"])

    _layer_schema = File.read!(layer_schema_path) |> Jason.decode!() |> Schema.resolve()
    _space_schema = File.read!(space_schema_path) |> Jason.decode!() |> Schema.resolve()

    assert true
  end
end

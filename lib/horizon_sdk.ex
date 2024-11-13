defmodule HorizonSdk do
  @moduledoc """
    Set of helpeer commands relating to API and hook inputs.

  """

  def set_block_properties(block, key, value) do
    properties = Map.get(block, "properties")
    new_properties = Map.put(properties, key, value)

    Map.put(block, "properties", new_properties)
  end

  def set_block_text(block, text) do
    properties = Map.get(block, "properties")
    new_properties = Map.put(properties, "text", text)

    Map.put(block, "properties", new_properties)
  end
end

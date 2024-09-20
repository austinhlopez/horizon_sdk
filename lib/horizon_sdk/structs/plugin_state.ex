defmodule HorizonSdk.PluginState do
  alias HorizonSdk.Adapter

  defstruct [
    :plugin_module,
    :space_id,
    :plugin_id,
    adapter: %{},
    data: %{},
    mapping: %{},
    simulation_id: nil
  ]

  @type t :: %__MODULE__{
          plugin_module: atom(),
          adapter: Adapter.t(),
          space_id: integer(),
          simulation_id: integer() | nil,
          plugin_id: integer(),
          mapping: map(),
          data: map()
        }
end

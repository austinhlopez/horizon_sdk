defmodule HorizonSdk.PluginState do
  alias HorizonSdk.APIAdapterState

  defstruct [
    :adapter_module,
    :plugin_module,
    :space_id,
    :plugin_id,
    adapter: %{},
    data: %{},
    mapping: %{},
    simulation_id: nil
  ]

  @type t :: %__MODULE__{
          adapter_module: atom(),
          plugin_module: atom(),
          adapter: APIAdapterState.t(),
          space_id: integer(),
          simulation_id: integer() | nil,
          plugin_id: integer(),
          mapping: map(),
          data: map()
        }
end

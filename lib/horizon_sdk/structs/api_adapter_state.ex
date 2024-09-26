defmodule HorizonSdk.APIAdapterState do
  alias HorizonSdk.APIAdapters.{
    HttpAdapterState,
    MemoryAdapterState,
    PersistAdapterState,
    SpaceServerAdapterState
  }

  @type t :: HttpAdapterState | MemoryAdapterState | PersistAdapterState | SpaceServerAdapterState
end

defmodule HorizonSdk.APIAdapterState do
  alias HorizonSdk.APIAdapters.{HttpAdapterState, SpaceServerAdapterState,
				PersistAdapterState, MemoryAdapterState}

  @type t :: HttpAdapterState | SpaceServerAdapterState | PersistAdapterState | MemoryAdapterState
end

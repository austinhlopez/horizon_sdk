defmodule HorizonSdk.AdapterState do
  alias HorizonSdk.{HttpAdapter, InternalAdapter, PersistsAdapter, MemoryAdapter}

  @type t :: HttpAdapterState | InternalAdapterState | PersistAdapterState | MemoryAdapterState
end

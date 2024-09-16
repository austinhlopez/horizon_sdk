defmodule HorizonSdk.Adapter do
  alias HorizonSdk.{HttpAdapter, InternalAdapter}

  @type t :: HttpAdapter | InternalAdapter
end

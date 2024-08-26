defmodule HorizonSdk.PackageInternalBehavior do
  alias ExJsonSchema.Schema

  @callback resolve_space_schema(plugin_name :: String.t()) :: Schema.Root.t() | :error
end

defmodule HorizonSdk.HookBehavior do
  @moduledoc """
  Horizon hooks are called when specific operations
  occur in a Horizon space.
  """

  @callback plugin_attachable?() :: :ok
  @callback on_plugin_attach() :: :ok

  @callback on_load() :: :ok

  @callback on_create_place() :: :ok
  @callback on_click_place() :: :ok
  @callback on_hover_place() :: :ok
  @callback on_delete_place() :: :ok

  @callback on_update_place_data() :: :ok

  @callback on_step_time_forward() :: :ok
end

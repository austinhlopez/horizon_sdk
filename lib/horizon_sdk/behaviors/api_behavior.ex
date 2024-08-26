defmodule HorizonSdk.ApiBehavior do
  @moduledoc """
  Horizon exposes multiple operations which can occur
  from within or without the core application, accessible via
  code or API for developers with the permission to
  edit a workspace or space programmatically.
  """

  # space updates
  @callback get_space() :: :ok

  @callback create_place() :: :ok
  @callback update_place() :: :ok
  @callback delete_place() :: :ok
  @callback get_place() :: :ok
  @callback get_places() :: :ok

  @callback create_layer() :: :ok
  @callback update_layer() :: :ok
  @callback delete_layer() :: :ok
  @callback get_layer() :: :ok
  @callback get_layers() :: :ok

  @callback set_layer_symbol() :: :ok
  @callback set_layer_3d() :: :ok

  @callback update_place_data() :: :ok
  @callback update_layer_data() :: :ok
  @callback update_space_data() :: :ok

  @callback set_color() :: :ok
  @callback set_size() :: :ok

  @callback get_variation() :: :ok
  @callback create_variation() :: :ok
  @callback set_variation() :: :ok

  @callback disable_step_time_forward() :: :ok
  @callback enable_step_time_forward() :: :ok
  @callback step_time_forward() :: :ok
end

defmodule HorizonSdk.ApiBehavior do
  @moduledoc """
  Horizon exposes multiple operations which can occur
  from within or without the core application, accessible via
  code or API for developers with the permission to
  edit a workspace or space programmatically.
  """

  # space updates
  @callback get_space(adapter :: map(), id :: integer()) :: {:ok, result :: map()}

  @callback create_place(adapter :: map(), payload :: map()) :: :ok
  @callback update_place(adapter :: map(), id :: integer(), payload :: map()) :: :ok
  @callback delete_place(adapter :: map(), id :: integer()) :: :ok
  @callback get_place(adapter :: map(), id :: integer()) :: {:ok, result :: map()}
  @callback get_places(adapter :: map(), ids :: list(integer())) :: :ok

  @callback create_layer(adapter :: map(), payload :: map()) :: :ok
  @callback update_layer(adapter :: map(), id :: integer(), payload :: map()) :: :ok
  @callback delete_layer(adapter :: map(), id :: integer()) :: :ok
  @callback get_layer(adapter :: map(), id :: integer()) :: {:ok, result :: map()}
  @callback get_layers(adapter :: map(), ids :: list(integer())) :: {:ok, result :: map()}

  @callback set_layer_symbol(layer_id :: integer(), payload :: map(), adapter :: map()) :: :ok
  @callback set_layer_3d(layer_id :: integer(), payload :: map(), adapter :: map()) :: :ok

  @callback update_place_data(place_id :: integer(), payload :: map(), adapter :: map()) :: :ok
  @callback update_layer_data(layer_id :: integer(), payload :: map(), adapter :: map()) :: :ok
  @callback update_space_data(space_id :: integer(), payload :: map(), adapter :: map()) :: :ok

  @callback set_color() :: :ok
  @callback set_size() :: :ok

  @callback get_variation() :: :ok
  @callback create_variation() :: :ok
  @callback set_variation() :: :ok

  @callback disable_step_time_forward() :: :ok
  @callback enable_step_time_forward() :: :ok
  @callback step_time_forward() :: :ok

  @callback update_block_content(id :: integer(), payload :: map(), adapter :: map()) :: :ok
  @callback update_block_property(id :: integer(), payload :: map(), adapter :: map()) :: :ok

  @callback set_tooltip(String.t()) :: :ok
end

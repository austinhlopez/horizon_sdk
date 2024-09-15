defmodule HorizonSdk.ApiBehavior do
  @moduledoc """
  Horizon exposes multiple operations which can occur
  from within or without the core application, accessible via
  code or API for developers with the permission to
  edit a workspace or space programmatically.
  """

  # space updates
  @callback get_space(id :: integer(), adapter :: map()) :: {:ok, result :: map()}

  @callback create_place(payload :: map(), adapter :: map()) :: :ok
  @callback update_place(id :: integer(), payload :: map(), adapter :: map()) :: :ok
  @callback delete_place(id :: integer(), adapter :: map()) :: :ok
  @callback get_place(id :: integer(), adapter :: map()) :: {:ok, result :: map()}
  @callback get_places(ids :: list(integer()), adapter :: map()) :: :ok

  @callback create_layer(payload :: map(), adapter :: map()) :: :ok
  @callback update_layer(id :: integer(), payload :: map(), adapter :: map()) :: :ok
  @callback delete_layer(id :: integer()) :: :ok
  @callback get_layer(id :: integer()) :: {:ok, result :: map()}
  @callback get_layers(ids :: list(integer())) :: {:ok, result :: map()}

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

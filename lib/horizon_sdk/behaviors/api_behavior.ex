defmodule HorizonSdk.ApiBehavior do
  @moduledoc """
  Horizon exposes multiple operations which can occur
  from within or without the core application, accessible via
  code or API for developers with the permission to
  edit a workspace or space programmatically.
  """

  # later, we might need to specify the struct of various
  # Horizon entities.

  alias HorizonSdk.APIAdapterState

  # mabye better to use opts, optionally containing adapter state.

  # (it's unclear whether adapter state needs to be returned from API behavior)

  # space
  @callback get_space(id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, result :: map(), adapter :: APIAdapterState.t()}

  @callback update_space!(
              space_id :: integer(),
              payload :: map(),
              user :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  # place
  @callback create_place(payload :: map(), adapter :: APIAdapterState.t()) ::
              {:ok, map(), APIAdapterState.t()}
  @callback create_place_from_feature!(
              feature_params :: map(),
              user :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback update_place!(
              place_id :: integer(),
              payload :: map(),
              user :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback update_place(id :: integer(), payload :: map(), adapter :: APIAdapterState.t()) :: :ok
  @callback update_place_from_feature!(
              place :: map(),
              feature_params :: map(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: map()

  @callback delete_place!(place :: map(), user :: map(), adapter :: APIAdapterState.t()) ::
              {:ok, APIAdapterState.t()}
  @callback delete_place(id :: integer(), adapter :: APIAdapterState.t()) :: :ok
  @callback get_place(id :: integer(), adapter :: APIAdapterState.t()) :: {:ok, result :: map()}
  @callback get_places(ids :: list(integer()), adapter :: APIAdapterState.t()) :: :ok

  # layer
  @callback create_layer(payload :: map(), adapter :: APIAdapterState.t()) :: :ok
  @callback update_layer(id :: integer(), payload :: map(), adapter :: APIAdapterState.t()) :: :ok
  @callback delete_layer(id :: integer(), adapter :: APIAdapterState.t()) :: :ok
  @callback get_layer(id :: integer(), user_id :: integer, adapter :: APIAdapterState.t()) ::
              {:ok, result :: map()}
  @callback get_layers(ids :: list(integer()), adapter :: APIAdapterState.t()) ::
              {:ok, result :: map()}
  @callback get_with_layer_places(layer_id :: integer(), adapter :: APIAdapterState.t()) :: map()

  @callback set_layer_symbol(
              layer_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok

  @callback set_layer_3d(layer_id :: integer(), payload :: map(), adapter :: APIAdapterState.t()) ::
              :ok

  # data
  @callback update_place_data(
              place_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok

  @callback update_layer_data(
              layer_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok

  @callback update_space_data(
              space_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok

  # map visual
  @callback set_color(adapter :: APIAdapterState.t()) :: :ok
  @callback set_size(adapter :: APIAdapterState.t()) :: :ok

  @callback update_circle_radius(
              layer_id :: integer,
              value :: integer(),
              adapter :: APIAdapterState.t()
            ) :: :ok

  # variations
  @callback get_variation(adapter :: APIAdapterState.t()) :: :ok
  @callback create_variation(adapter :: APIAdapterState.t()) :: :ok

  @callback set_variation(adapter :: APIAdapterState.t()) :: :ok

  # time
  @callback disable_step_time_forward(adapter :: APIAdapterState.t()) :: :ok
  @callback enable_step_time_forward(adapter :: APIAdapterState.t()) :: :ok
  @callback step_time_forward(adapter :: APIAdapterState.t()) :: :ok

  # blocks
  @callback update_block_content(
              id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok
  @callback update_block_property(
              id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok

  # tooltip
  @callback set_tooltip(String.t(), adapter :: APIAdapterState.t()) :: :ok

  # space plugin
  @callback get_space_plugin_by_space_id_plugin_id(
              space_id :: integer(),
              plugin_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, result :: map(), APIAdapterState.t()}

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.ApiBehavior

      def update_space!(space_id, params, user_id, adapter), do: {:ok, params, adapter}
      def get_space(id, adapter), do: {:ok, nil}
      def create_place(payload, adapter), do: :ok
      def create_place_from_feature!(feature_params, current_user), do: %{}

      def update_place(id, payload, adapter), do: :ok
      def update_place_from_feature!(selected_place, feature_params, current_user), do: %{}

      def delete_place(id, adapter), do: :ok
      def get_place(id, adapter), do: {:ok, nil}
      def get_places(ids, adapter), do: :ok

      # layer
      def create_layer(payload, adapter), do: :ok
      def update_layer(id, payload, adapter), do: :ok
      def delete_layer(id, adapter), do: :ok

      def get_layer(id, user_id, adapter), do: {:ok, nil, adapter}
      def get_layers(ids, adapter), do: {:ok, %{}}

      def get_with_layer_places(layer_id), do: %{}

      def set_layer_symbol(layer_id, payload, adapter), do: :ok
      def set_layer_3d(layer_id, payload, adapter), do: :ok

      def update_place_data(place_id, payload, adapter), do: :ok
      def update_layer_data(layer_id, payload, adapter), do: :ok
      def update_space_data(space_id, payload, adapter), do: :ok
      def set_color(adapter), do: :ok
      def set_size(adapter), do: :ok
      def get_variation(adapter), do: :ok
      def create_variation(adapter), do: :ok
      def set_variation(adapter), do: :ok
      def disable_step_time_forward(adapter), do: :ok
      def enable_step_time_forward(adapter), do: :ok
      def step_time_forward(adapter), do: :ok
      def update_block_content(id, payload, adapter), do: :ok
      def update_block_property(id, payload, adapter), do: :ok
      def set_tooltip(_, adapter), do: :ok

      defoverridable get_space: 2,
                     update_space!: 3,
                     create_place: 2,
                     update_place: 3,
                     delete_place: 2,
                     get_place: 2,
                     get_places: 2,
                     create_layer: 2,
                     update_layer: 3,
                     delete_layer: 2,
                     get_layer: 3,
                     get_layers: 2,
                     set_layer_symbol: 3,
                     set_layer_3d: 3,
                     update_place_data: 3,
                     update_layer_data: 3,
                     update_space_data: 3,
                     set_color: 1,
                     set_size: 1,
                     get_variation: 1,
                     create_variation: 1,
                     set_variation: 1,
                     disable_step_time_forward: 1,
                     enable_step_time_forward: 1,
                     step_time_forward: 1,
                     update_block_content: 3,
                     update_block_property: 3,
                     set_tooltip: 2
    end
  end
end

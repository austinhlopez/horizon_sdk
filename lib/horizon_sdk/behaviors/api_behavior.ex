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
  @callback get_space(id :: integer(), user_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, result :: map(), adapter :: APIAdapterState.t()}

  @callback update_space!(
              space_id :: integer(),
              payload :: map(),
              user :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  # place
  @callback create_place(payload :: map(), user_id :: integer(), adapter :: APIAdapterState.t()) ::
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
  @callback update_place(
              id :: integer(),
              payload :: map(),
              user :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback update_place_from_feature!(
              place :: map(),
              feature_params :: map(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback delete_place!(place :: map(), user :: map(), adapter :: APIAdapterState.t()) ::
              {:ok, APIAdapterState.t()}
  @callback delete_place(id :: integer(), user :: map(), adapter :: APIAdapterState.t()) ::
              {:ok, APIAdapterState.t()}

  @callback get_place(id :: integer(), user_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, map(), APIAdapterState.t()}
  @callback get_places(
              ids :: list(integer()),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, list(map()), APIAdapterState.t()}

  # layer
  @callback create_layer(payload :: map(), user_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, map(), APIAdapterState.t()}
  @callback update_layer(
              id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback delete_layer(id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, APIAdapterState.t()}

  @callback get_layer(id :: integer(), user_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, map(), APIAdapterState.t()}
  @callback get_layers(
              ids :: list(integer()),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, list(map()), APIAdapterState.t()}

  @callback get_with_layer_places(
              layer_id :: integer(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback set_layer_symbol(
              layer_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  @callback set_layer_3d(
              layer_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  # data
  @callback update_place_data(
              place_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback update_layer_data(
              layer_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback update_space_data(
              space_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  # map visual
  # TODO: fill out API

  # Question about simulations vs. spaces
  # for almost ALL API functions
  @callback set_color(adapter :: APIAdapterState.t()) :: :ok
  @callback set_size(adapter :: APIAdapterState.t()) :: :ok

  @callback update_circle_radius(
              layer_id :: integer,
              value :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  # variations
  @callback get_variation(
              variation_id :: integer(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback create_variation(
              payload :: map(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  @callback set_variation(
              variation_id :: integer(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, APIAdapterState.t()}

  # time
  @callback disable_step_time_forward(adapter :: APIAdapterState.t()) :: :ok
  @callback enable_step_time_forward(adapter :: APIAdapterState.t()) :: :ok
  @callback step_time_forward(adapter :: APIAdapterState.t()) :: :ok

  # blocks
  @callback update_block_content(
              id :: integer(),
              user_id :: integer(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: :ok
  @callback update_block_property(
              id :: integer(),
              user_id :: integer(),
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

      def get_space(id, user_id, adapter), do: {:ok, %{}, adapter}

      def update_space!(space_id, params, user_id, adapter), do: {:ok, params, adapter}

      def create_place(payload, user_id, adapter), do: {:ok, %{}, adapter}

      def create_place_from_feature!(feature_params, current_user, adapter),
        do: {:ok, %{}, adapter}

      def update_place!(id, payload, user, adapter), do: {:ok, payload, adapter}
      def update_place(id, payload, user, adapter), do: {:ok, payload, adapter}

      def update_place_from_feature!(selected_place, feature_params, current_user, adapter),
        do: {:ok, feature_params, adapter}

      def delete_place!(place, user, adapter), do: {:ok, adapter}
      def delete_place(id, user, adapter), do: {:ok, adapter}

      def get_place(id, user_id, adapter), do: {:ok, %{}, adapter}
      def get_places(ids, user_id, adapter), do: {:ok, [], adapter}

      # layer
      def create_layer(payload, user_id, adapter), do: {:ok, %{}, adapter}
      def update_layer(id, user_id, payload, adapter), do: {:ok, %{}, adapter}
      def delete_layer(id, user_id, adapter), do: {:ok, adapter}

      def get_layer(id, user_id, adapter), do: {:ok, %{}, adapter}
      def get_layers(ids, user_id, adapter), do: {:ok, [], adapter}

      def get_with_layer_places(layer_id, user_id, adapter), do: {:ok, %{}, adapter}

      def set_layer_symbol(layer_id, user_id, payload, adapter), do: {:ok, adapter}
      def set_layer_3d(layer_id, user_id, payload, adapter), do: {:ok, adapter}

      def update_place_data(place_id, user_id, payload, adapter), do: {:ok, %{}, adapter}
      def update_layer_data(layer_id, user_id, payload, adapter), do: {:ok, %{}, adapter}
      def update_space_data(space_id, user_id, payload, adapter), do: {:ok, %{}, adapter}

      def set_color(adapter), do: :ok
      def set_size(adapter), do: :ok
      def update_circle_radius(layer_id, value, adapter), do: {:ok, adapter}

      def get_variation(variation_id, user_id, adapter), do: {:ok, %{}, adapter}
      def create_variation(payload, user_id, adapter), do: {:ok, %{}, adapter}
      def set_variation(variation_id, user_id, adapter), do: {:ok, adapter}

      # time
      def disable_step_time_forward(adapter), do: {:ok, adapter}
      def enable_step_time_forward(adapter), do: {:ok, adapter}
      def step_time_forward(adapter), do: {:ok, adapter}

      # blocks
      def update_block_content(id, user_id, payload, adapter), do: :ok
      def update_block_property(id, user_id, payload, adapter), do: :ok

      # tooltips
      def set_tooltip(_, adapter), do: :ok

      defoverridable get_space: 3,
                     update_space!: 4,
                     create_place: 3,
                     create_place_from_feature!: 3,
                     update_place!: 4,
                     update_place: 4,
                     update_place_from_feature!: 4,
                     delete_place!: 3,
                     delete_place: 3,
                     get_place: 3,
                     get_places: 3,
                     create_layer: 3,
                     update_layer: 4,
                     delete_layer: 3,
                     get_layer: 3,
                     get_layers: 3,
                     get_with_layer_places: 3,
                     set_layer_symbol: 4,
                     set_layer_3d: 4,
                     update_place_data: 4,
                     update_layer_data: 4,
                     update_space_data: 4,
                     set_color: 1,
                     set_size: 1,
                     update_circle_radius: 3,
                     get_variation: 3,
                     create_variation: 3,
                     set_variation: 3,
                     disable_step_time_forward: 1,
                     enable_step_time_forward: 1,
                     step_time_forward: 1,
                     update_block_content: 4,
                     update_block_property: 4,
                     set_tooltip: 2
    end
  end
end

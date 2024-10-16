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

  # mabye better to use scope, optionally containing adapter state.

  # (it's unclear whether adapter state needs to be returned from API behavior)

  # space
  @callback get_space(
              id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, result :: map(), adapter :: APIAdapterState.t()}

  @callback update_space!(
              space_id :: integer(),
              payload :: map(),
              user :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  # place
  @callback create_place(
              payload :: map(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, map(), APIAdapterState.t()}
  @callback create_place_from_feature!(
              feature_params :: map(),
              user :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback update_place!(
              place_id :: integer(),
              payload :: map(),
              user :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback update_place(
              id :: integer(),
              payload :: map(),
              user :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback update_place_from_feature!(
              place :: map(),
              feature_params :: map(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback delete_place!(
              place :: map(),
              user :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, APIAdapterState.t()}
  @callback delete_place(
              id :: integer(),
              user :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, APIAdapterState.t()}

  @callback get_place(
              id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, map(), APIAdapterState.t()}
  @callback get_places(
              ids :: list(integer()),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, list(map()), APIAdapterState.t()}

  # layer
  @callback create_layer(
              payload :: map(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, map(), APIAdapterState.t()}
  @callback update_layer(
              id :: integer(),
              user_id :: integer(),
              scope :: map(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback delete_layer(
              id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, APIAdapterState.t()}

  @callback get_layer(
              id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, map(), APIAdapterState.t()}
  @callback get_layers(
              ids :: list(integer()),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, list(map()), APIAdapterState.t()}

  @callback get_with_layer_places(
              layer_id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback set_layer_symbol(
              layer_id :: integer(),
              user_id :: integer(),
              scope :: map(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  @callback set_layer_3d(
              layer_id :: integer(),
              user_id :: integer(),
              scope :: map(),
              payload :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  # layer places
  @callback get_layer_places_by_layer_id(
              layer_id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, list(map()), APIAdapterState.t()}

  # data
  @callback update_place_data(
              place_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback update_layer_data(
              layer_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback update_space_data(
              space_id :: integer(),
              user_id :: integer(),
              payload :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  # map visual
  # TODO: fill out API

  # Question about simulations vs. spaces
  # for almost ALL API functions
  @callback set_color(scope :: map(), adapter :: APIAdapterState.t()) ::
              {:ok, APIAdapterState.t()}
  @callback set_size(scope :: map(), adapter :: APIAdapterState.t()) :: {:ok, APIAdapterState.t()}

  @callback update_circle_radius(
              layer_id :: integer,
              value :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  # variations
  @callback get_variation(
              variation_id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback create_variation(
              payload :: map(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  @callback set_variation(
              variation_id :: integer(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) ::
              {:ok, APIAdapterState.t()}

  # time
  @callback disable_step_time_forward(scope :: map(), adapter :: APIAdapterState.t()) :: :ok
  @callback enable_step_time_forward(scope :: map(), adapter :: APIAdapterState.t()) :: :ok
  @callback step_time_forward(scope :: map(), adapter :: APIAdapterState.t()) :: :ok

  # blocks
  @callback update_block_content(
              id :: String.t(),
              user_id :: integer(),
              payload :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}
  @callback update_block_property(
              id :: String.t(),
              user_id :: integer(),
              payload :: map(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, map(), APIAdapterState.t()}

  @callback set_block_text(
              id :: String.t(),
              user_id :: integer(),
              text :: String.t(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, APIAdapterState.t()}

  @callback get_block_text(
              id :: String.t(),
              user_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, String.t(), APIAdapterState.t()}

  # tooltip
  @callback set_tooltip(text :: String.t(), scope :: map(), adapter :: APIAdapterState.t()) :: :ok

  # space plugin
  @callback get_space_plugin_by_space_id_plugin_id(
              space_id :: integer(),
              plugin_id :: integer(),
              scope :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, result :: map(), APIAdapterState.t()}

  # services
  @callback llm_complete_turbo_4_json(
              context :: String.t(),
              text :: String.t(),
              response_format :: map(),
              max_tokens :: integer(),
              user_id :: integer(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, result :: String.t() | map(), adapter :: APIAdapterState.t()}

  # --- collections + feeds #

  # collections
  @callback get_rss_feeds(collection_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, result :: list(map()), adapter :: APIAdapterState.t()}

  @callback get_x_feeds(collection_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, result :: list(map()), adapter :: APIAdapterState.t()}

  @callback get_recent_posts(
              collection_id :: integer(),
              user_id :: integer(),
              opts :: map(),
              adapter :: APIAdapterState.t()
            ) :: {:ok, result :: list(map()), adapter :: APIAdapterState.t()}

  # rss feeds
  @callback get_posts(rss_feed_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, result :: list(map()), adapter :: APIAdapterState.t()}

  # x feeds
  @callback get_x_posts(x_feed_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, result :: list(map()), adapter :: APIAdapterState.t()}

  # control

  # tick can be launched by
  # a package or plugin to itself
  @callback tick(space_plugin_id :: integer(), adapter :: APIAdapterState.t()) ::
              {:ok, adapter :: APIAdapterState.t()}

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.ApiBehavior

      def get_space(id, user_id, scope, adapter), do: {:ok, %{}, adapter}

      def update_space!(space_id, params, user_id, scope, adapter), do: {:ok, params, adapter}

      def create_place(payload, user_id, scope, adapter), do: {:ok, %{}, adapter}

      def create_place_from_feature!(feature_params, current_user, scope, adapter),
        do: {:ok, %{}, adapter}

      def update_place!(id, payload, user, scope, adapter), do: {:ok, payload, adapter}
      def update_place(id, payload, user, scope, adapter), do: {:ok, payload, adapter}

      def update_place_from_feature!(
            selected_place,
            feature_params,
            current_user,
            scope,
            adapter
          ),
          do: {:ok, feature_params, adapter}

      def delete_place!(place, user, scope, adapter), do: {:ok, adapter}
      def delete_place(id, user, scope, adapter), do: {:ok, adapter}

      def get_place(id, user_id, scope, adapter), do: {:ok, %{}, adapter}
      def get_places(ids, user_id, scope, adapter), do: {:ok, [], adapter}

      # layer
      def create_layer(payload, user_id, scope, adapter), do: {:ok, %{}, adapter}
      def update_layer(id, user_id, payload, scope, adapter), do: {:ok, %{}, adapter}
      def delete_layer(id, user_id, scope, adapter), do: {:ok, adapter}

      def get_layer(id, user_id, scope, adapter), do: {:ok, %{}, adapter}
      def get_layers(ids, user_id, scope, adapter), do: {:ok, [], adapter}

      def get_with_layer_places(layer_id, user_id, scope, adapter), do: {:ok, %{}, adapter}

      def set_layer_symbol(layer_id, user_id, payload, scope, adapter), do: {:ok, adapter}
      def set_layer_3d(layer_id, user_id, payload, scope, adapter), do: {:ok, adapter}

      # layer places
      def get_layer_places_by_layer_id(layer_id, user_id, scope, adapter), do: {:ok, [], adapter}

      def update_place_data(place_id, user_id, payload, scope, adapter), do: {:ok, %{}, adapter}
      def update_layer_data(layer_id, user_id, payload, scope, adapter), do: {:ok, %{}, adapter}
      def update_space_data(space_id, user_id, payload, scope, adapter), do: {:ok, %{}, adapter}

      def set_color(scope, adapter), do: {:ok, adapter}
      def set_size(scope, adapter), do: {:ok, adapter}
      def update_circle_radius(layer_id, value, scope, adapter), do: {:ok, adapter}

      def get_variation(variation_id, user_id, scope, adapter), do: {:ok, %{}, adapter}
      def create_variation(payload, user_id, scope, adapter), do: {:ok, %{}, adapter}
      def set_variation(variation_id, user_id, scope, adapter), do: {:ok, adapter}

      # time
      def disable_step_time_forward(scope, adapter), do: {:ok, adapter}
      def enable_step_time_forward(scope, adapter), do: {:ok, adapter}
      def step_time_forward(scope, adapter), do: {:ok, adapter}

      # blocks
      def update_block_content(id, user_id, payload, scope, adapter), do: {:ok, %{}, adapter}
      def update_block_property(id, user_id, payload, scope, adapter), do: {:ok, %{}, adapter}

      def set_block_text(id, user_id, text, scope, adapter), do: {:ok, "", adapter}
      def get_block_text(id, user_id, scope, adapter), do: {:ok, "", adapter}

      # tooltips
      def set_tooltip(_, scope, adapter), do: :ok

      # space plugin
      def get_space_plugin_by_space_id_plugin_id(_, _, scope, adapter), do: {:ok, %{}, adapter}

      # services
      def llm_complete_turbo_4_json(context, text, response_format, max_tokens, user_id, adapter),
        do: {:ok, "", adapter}

      # collections
      def get_rss_feeds(collection_id, adapter), do: {:ok, [], adapter}

      def get_x_feeds(collection_id, adapter), do: {:ok, [], adapter}

      def get_recent_posts(collection_id, user_id, opts, adapter), do: {:ok, [], adapter}

      def get_posts(rss_feed_id, adapter), do: {:ok, [], adapter}
      def get_x_posts(x_feed_id, adapter), do: {:ok, [], adapter}

      # control
      def tick(space_plugin_id, adapter), do: adapter

      defoverridable get_space: 4,
                     update_space!: 5,
                     create_place: 4,
                     create_place_from_feature!: 4,
                     update_place!: 5,
                     update_place: 5,
                     update_place_from_feature!: 5,
                     delete_place!: 4,
                     delete_place: 4,
                     get_place: 4,
                     get_places: 4,
                     create_layer: 4,
                     update_layer: 5,
                     delete_layer: 4,
                     get_layer: 4,
                     get_layers: 4,
                     get_with_layer_places: 4,
                     set_layer_symbol: 5,
                     set_layer_3d: 5,
                     get_layer_places_by_layer_id: 4,
                     update_place_data: 5,
                     update_layer_data: 5,
                     update_space_data: 5,
                     set_color: 2,
                     set_size: 2,
                     update_circle_radius: 4,
                     get_variation: 4,
                     create_variation: 4,
                     set_variation: 4,
                     disable_step_time_forward: 2,
                     enable_step_time_forward: 2,
                     step_time_forward: 2,
                     update_block_content: 5,
                     update_block_property: 5,
                     set_block_text: 5,
                     get_block_text: 4,
                     set_tooltip: 3,
                     get_space_plugin_by_space_id_plugin_id: 4,
                     llm_complete_turbo_4_json: 6,
                     get_rss_feeds: 2,
                     get_x_feeds: 2,
                     get_recent_posts: 4,
                     get_posts: 2,
                     get_x_posts: 2,
                     tick: 2
    end
  end
end

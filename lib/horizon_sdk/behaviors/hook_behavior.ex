defmodule HorizonSdk.HookBehavior do
  @moduledoc """
  Horizon hooks are called when specific operations
  occur in a Horizon space.
  """

  alias HorizonSdk.Structs.PluginState

  # plugins
  @callback plugin_attachable?() :: boolean()
  @callback on_plugin_attach(state :: PluginState.t()) :: PluginState.t()
  @callback on_init(user_id :: integer(), state :: PluginState.t()) :: state :: PluginState.t()

  # space_live
  @callback on_load(session_id :: binary(), user_id :: integer(), state :: PluginState.t()) ::
              PluginState.t()

  # space create
  @callback on_create_place(place_id :: integer(), user_id :: integer(), state :: PluginState.t()) ::
              PluginState.t()
  @callback on_create_layer_place(
              layer_id :: integer(),
              place_id :: integer(),
              user_id :: integer(),
              layer_place_id :: integer(),
              state :: PluginState.t()
            ) :: PluginState.t()
  @callback on_place_click(
              place_id :: integer(),
              session_id :: binary(),
              user_id :: integer(),
              state :: PluginState.t()
            ) :: PluginState.t()
  @callback on_hover_place(place_id :: integer(), user_id :: integer(), state :: PluginState.t()) ::
              PluginState.t()
  @callback on_delete_place(place_id :: integer(), user_id :: integer(), state :: PluginState.t()) ::
              PluginState.t()

  @callback on_update_place_data(
              place_id :: integer(),
              user_id :: integer(),
              state :: PluginState.t()
            ) ::
              PluginState.t()

  # simulation
  @callback on_simulation_start(
              simulation_id :: integer(),
              user_id :: integer(),
              state :: PluginState.t()
            ) :: PluginState.t()

  @callback on_step_time_forward(timestamp :: integer(), state :: PluginState.t()) ::
              PluginState.t()

  # 'tick' is a manually sent step
  @callback on_tick(state :: PluginState.t()) :: PluginState.t()

  # cron is manually set up
  @callback on_hourly_cron(state :: PluginState.t()) :: PluginState.t()
  @callback on_monthly_cron(state :: PluginState.t()) :: PluginState.t()
  @callback on_daily_cron(state :: PluginState.t()) :: PluginState.t()
  @callback on_minutely_cron(state :: PluginState.t()) :: PluginState.t()

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.HookBehavior

      # some of these might now be package behaviors
      def plugin_attachable?, do: false
      def on_plugin_attach(state), do: state
      def on_init(user_id, state), do: state

      def on_load(session_id, user_id, state), do: state

      def on_create_place(place_id, user_id, state), do: state
      def on_create_layer_place(layer_id, place_id, user_id, layer_place_id, state), do: state

      def on_click_place(place_id, user_id, state), do: state
      def on_hover_place(place_id, user_id, state), do: state
      def on_delete_place(place_id, user_id, state), do: state

      def on_hourly_cron, do: state
      def on_monthly_cron, do: state
      def on_daily_cron, do: state
      def on_minutely_cron, do: state

      def on_simulation_start(simulation_id, user_id, state), do: state

      def on_update_place_data(place_id, user_id, state), do: state

      def on_step_time_forward(timestamp, state), do: state

      def on_tick(state), do: state

      def on_hourly_cron(state), do: state
      def on_monthly_cron(state), do: state
      def on_daily_cron(state), do: state
      def on_minutely_cron(state), do: state

      defoverridable plugin_attachable?: 0,
                     on_plugin_attach: 1,
                     on_load: 3,
                     on_create_place: 3,
                     on_create_layer_place: 5,
                     on_click_place: 3,
                     on_hover_place: 3,
                     on_delete_place: 3,
                     on_simulation_start: 3,
                     on_update_place_data: 3,
                     on_step_time_forward: 2,
                     on_tick: 1,
                     on_hourly_cron: 1,
                     on_monthly_cron: 1,
                     on_daily_cron: 1,
                     on_minutely_cron: 1
    end
  end
end

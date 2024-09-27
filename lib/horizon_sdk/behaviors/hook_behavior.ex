defmodule HorizonSdk.HookBehavior do
  @moduledoc """
  Horizon hooks are called when specific operations
  occur in a Horizon space.
  """

  alias HorizonSdk.Structs.PluginState

  @callback plugin_attachable?() :: boolean()
  @callback on_plugin_attach(state :: PluginState.t()) :: PluginState.t()

  @callback on_load(user_id :: integer(), state :: PluginState.t()) :: PluginState.t()

  @callback on_create_place(place_id :: integer(), user_id :: integer(), state :: PluginState.t()) ::
              PluginState.t()
  @callback on_create_layer_place(
              layer_id :: integer(),
              place_id :: integer(),
              user_id :: integer(),
              layer_place_id :: integer(),
              state :: PluginState.t()
            ) :: PluginState.t()
  @callback on_click_place(place_id :: integer(), user_id :: integer(), state :: PluginState.t()) ::
              PluginState.t()
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

  @callback on_simulation_start(
              simulation_id :: integer(),
              user_id :: integer(),
              state :: PluginState.t()
            ) :: PluginState.t()

  @callback on_step_time_forward(timestamp :: integer(), state :: PluginState.t()) ::
              PluginState.t()

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.HookBehavior

      # some of these might now be package behaviors
      def plugin_attachable?, do: false
      def on_plugin_attach(state), do: state

      def on_load(user_id, state), do: state

      def on_create_place(place_id, user_id, state), do: state
      def on_create_layer_place(layer_id, place_id, user_id, layer_place_id, state), do: state

      def on_click_place(place_id, user_id, state), do: state
      def on_hover_place(place_id, user_id, state), do: state
      def on_delete_place(place_id, user_id, state), do: state

      def on_simulation_start(simulation_id, user_id, state), do: state

      def on_update_place_data(place_id, user_id, state), do: state

      def on_step_time_forward(timestamp, state), do: state

      defoverridable plugin_attachable?: 0,
                     on_plugin_attach: 1,
                     on_load: 2,
                     on_create_place: 3,
                     on_create_layer_place: 5,
                     on_click_place: 3,
                     on_hover_place: 3,
                     on_delete_place: 3,
                     on_simulation_start: 3,
                     on_update_place_data: 3,
                     on_step_time_forward: 2
    end
  end
end

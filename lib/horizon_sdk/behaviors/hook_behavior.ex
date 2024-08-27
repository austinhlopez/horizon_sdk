defmodule HorizonSdk.HookBehavior do
  @moduledoc """
  Horizon hooks are called when specific operations
  occur in a Horizon space.
  """

  @callback plugin_attachable?() :: any()
  @callback on_plugin_attach() :: any()

  @callback on_load() :: any()

  @callback on_create_place() :: any()
  @callback on_click_place() :: any()
  @callback on_hover_place() :: any()
  @callback on_delete_place() :: any()

  @callback on_update_place_data() :: any()

  @callback on_step_time_forward() :: any()

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.HookBehavior

      def on_click_place, do: :ok
      def on_create_place, do: :ok
      def on_delete_place, do: :ok
      def on_hover_place, do: :ok
      def on_load, do: :ok
      def on_plugin_attach, do: :ok
      def on_step_time_forward, do: :ok
      def on_update_place_data, do: :ok
      def plugin_attachable?, do: :ok

      defoverridable on_click_place: 0,
                     on_create_place: 0,
                     on_delete_place: 0,
                     on_hover_place: 0,
                     on_load: 0,
                     on_plugin_attach: 0,
                     on_step_time_forward: 0,
                     on_update_place_data: 0,
                     plugin_attachable?: 0
    end
  end
end

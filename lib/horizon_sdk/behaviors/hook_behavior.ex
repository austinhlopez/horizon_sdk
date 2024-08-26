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

      def on_click_place(), do: default_on_click_place()
      def on_create_place(), do: default_on_create_place()
      def on_delete_place(), do: default_on_delete_place()
      def on_hover_place(), do: default_on_hover_place()
      def on_load(), do: default_on_load()
      def on_plugin_attach(), do: default_on_plugin_attach()
      def on_step_time_forward(), do: default_on_step_time_forward()
      def on_update_place_data(), do: default_on_update_place_data()
      def plugin_attachable?(), do: default_plugin_attachable?()

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

  @doc false
  def default_on_click_place(), do: :ok
  @doc false
  def default_on_create_place(), do: :ok
  @doc false
  def default_on_delete_place(), do: :ok
  @doc false
  def default_on_hover_place(), do: :ok
  @doc false
  def default_on_load(), do: :ok
  @doc false
  def default_on_plugin_attach(), do: :ok
  @doc false
  def default_on_step_time_forward(), do: :ok
  @doc false
  def default_on_update_place_data(), do: :ok
  @doc false
  def default_plugin_attachable?(), do: :ok
end

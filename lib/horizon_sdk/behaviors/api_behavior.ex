defmodule HorizonSdk.ApiBehavior do
  @moduledoc """
  Horizon exposes multiple operations which can occur
  from within or without the core application, accessible via
  code or API for developers with the permission to
  edit a workspace or space programmatically.
  """

  # space updates
  @callback get_space() :: any()

  @callback create_place() :: any()
  @callback update_place() :: any()
  @callback delete_place() :: any()
  @callback get_place() :: any()
  @callback get_places() :: any()

  @callback create_layer() :: any()
  @callback update_layer() :: any()
  @callback delete_layer() :: any()
  @callback get_layer() :: any()
  @callback get_layers() :: any()

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

  @callback set_tooltip(String.t()) :: :ok

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.ApiBehavior

      def get_space, :ok

      def create_place, :ok
      def update_place, :ok
      def delete_place, :ok
      def get_place, :ok
      def get_places, :ok

      def create_layer, :ok
      def update_layer, :ok
      def delete_layer, :ok
      def get_layer, :ok
      def get_layers, :ok

      def set_layer_symbol, :ok
      def set_layer_3d, :ok

      def update_place_data, :ok
      def update_layer_data, :ok
      def update_space_data, :ok

      def set_color, :ok
      def set_size, :ok

      def get_variation, :ok
      def create_variation, :ok
      def set_variation, :ok

      def disable_step_time_forward, :ok
      def enable_step_time_forward, :ok
      def step_time_forward, :ok

      def set_tooltip(_), :ok
    end
  end
end

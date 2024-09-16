defmodule HorizonSdk.ApiBehavior do
  @moduledoc """
  Horizon exposes multiple operations which can occur
  from within or without the core application, accessible via
  code or API for developers with the permission to
  edit a workspace or space programmatically.
  """

  alias HorizonSdk.Adapter
  # space updates
  @callback get_space(id :: integer(), adapter :: Adapter.t()) :: {:ok, result :: map()}

  @callback create_place(payload :: map(), adapter :: Adapter.t()) :: :ok
  @callback update_place(id :: integer(), payload :: map(), adapter :: Adapter.t()) :: :ok
  @callback delete_place(id :: integer(), adapter :: Adapter.t()) :: :ok
  @callback get_place(id :: integer(), adapter :: Adapter.t()) :: {:ok, result :: map()}
  @callback get_places(ids :: list(integer()), adapter :: Adapter.t()) :: :ok

  @callback create_layer(payload :: map(), adapter :: Adapter.t()) :: :ok
  @callback update_layer(id :: integer(), payload :: map(), adapter :: Adapter.t()) :: :ok
  @callback delete_layer(id :: integer(), adapter :: Adapter.t()) :: :ok
  @callback get_layer(id :: integer(), adapter :: Adapter.t()) :: {:ok, result :: map()}
  @callback get_layers(ids :: list(integer()), adapter :: Adapter.t()) :: {:ok, result :: map()}

  @callback set_layer_symbol(layer_id :: integer(), payload :: map(), adapter :: Adapter.t()) ::
              :ok
  @callback set_layer_3d(layer_id :: integer(), payload :: map(), adapter :: Adapter.t()) :: :ok

  @callback update_place_data(place_id :: integer(), payload :: map(), adapter :: Adapter.t()) ::
              :ok
  @callback update_layer_data(layer_id :: integer(), payload :: map(), adapter :: Adapter.t()) ::
              :ok
  @callback update_space_data(space_id :: integer(), payload :: map(), adapter :: Adapter.t()) ::
              :ok

  @callback set_color(adapter :: Adapter.t()) :: :ok
  @callback set_size(adapter :: Adapter.t()) :: :ok

  @callback get_variation(adapter :: Adapter.t()) :: :ok
  @callback create_variation(adapter :: Adapter.t()) :: :ok
  @callback set_variation(adapter :: Adapter.t()) :: :ok

  @callback disable_step_time_forward(adapter :: Adapter.t()) :: :ok
  @callback enable_step_time_forward(adapter :: Adapter.t()) :: :ok
  @callback step_time_forward(adapter :: Adapter.t()) :: :ok

  @callback update_block_content(id :: integer(), payload :: map(), adapter :: Adapter.t()) :: :ok
  @callback update_block_property(id :: integer(), payload :: map(), adapter :: Adapter.t()) ::
              :ok

  @callback set_tooltip(String.t(), adapter :: Adapter.t()) :: :ok

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.ApiBehavior

      def get_space(id, adapter), do: {:ok, nil}
      def create_place(payload, adapter), do: :ok
      def update_place(id, payload, adapter), do: :ok
      def delete_place(id, adapter), do: :ok
      def get_place(id, adapter), do: {:ok, nil}
      def get_places(ids, adapter), do: :ok
      def create_layer(payload, adapter), do: :ok
      def update_layer(id, payload, adapter), do: :ok
      def delete_layer(id, adapter), do: :ok
      def get_layer(id, adapter), do: {:ok, nil}
      def get_layers(ids, adapter), do: {:ok, %{}}
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
                     create_place: 2,
                     update_place: 3,
                     delete_place: 2,
                     get_place: 2,
                     get_places: 2,
                     create_layer: 2,
                     update_layer: 3,
                     delete_layer: 2,
                     get_layer: 2,
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

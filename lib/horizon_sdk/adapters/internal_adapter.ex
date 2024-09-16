defmodule HorizonSdk.Adapters.InternalAdapter do
  use HorizonSdk.ApiBehavior

  def get_space(id, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:get_space, id})
  end

  def create_place(payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:create_place, payload})
  end

  def update_place(id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_place, id, payload})
  end

  def delete_place(id, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:delete_place, id})
  end

  def get_place(id, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:get_place, id})
  end

  def get_places(ids, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:get_places, ids})
  end

  def create_layer(payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:create_layer, payload})
  end

  def update_layer(id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_layer, id, payload})
  end

  def delete_layer(id, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:delete_layer, id})
  end

  def get_layer(id, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:get_layer, id})
  end

  def get_layers(ids, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:get_layers, ids})
  end

  def set_layer_symbol(layer_id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:set_layer_symbol, layer_id, payload})
  end

  def set_layer_3d(layer_id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:set_layer_3d, layer_id, payload})
  end

  def update_place_data(place_id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_place_data, place_id, payload})
  end

  def update_layer_data(layer_id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_layer_data, layer_id, payload})
  end

  def update_space_data(space_id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_space_data, space_id, payload})
  end

  def set_color(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :set_color)
  end

  def set_size(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :set_size)
  end

  def get_variation(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :get_variation)
  end

  def create_variation(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :create_variation)
  end

  def set_variation(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :set_variation)
  end

  def disable_step_time_forward(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :disable_step_time_forward)
  end

  def enable_step_time_forward(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :enable_step_time_forward)
  end

  def step_time_forward(%{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, :step_time_forward)
  end

  def update_block_content(id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_block_content, id, payload})
  end

  def update_block_property(id, payload, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:update_block_property, id, payload})
  end

  def set_tooltip(tooltip, %{api_server_pid: api_server_pid}) do
    GenServer.call(api_server_pid, {:set_tooltip, tooltip})
  end
end

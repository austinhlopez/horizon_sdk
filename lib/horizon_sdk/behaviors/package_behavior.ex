defmodule HorizonSdk.PackageBehavior do
  @moduledoc """
  Horizon's package callbacks are used to
  register packages and attach plugins.

  They are operations called during registration and attachment,
  rather than as responses to space-related events.
  """

  @callback attach_package(
              package_id :: integer,
              workspace_id :: integer
            ) :: :ok | :error
  @callback register_package(params :: map) :: :ok | :error
  @callback package_registered?(package_id :: integer, workspace_id :: integer) :: boolean

  @callback attach_plugin(plugin_id :: integer, space_id :: integer) :: :ok | :error
  @callback plugin_attachable?(plugin_id :: integer, space_id :: integer, schema :: map) ::
              boolean
  @callback plugin_attached?(space_id :: integer) :: boolean
  @callback get_plugin_id_attached(space_id :: integer) :: integer | nil

  @callback initialize_mapping() :: map()
  @callback initialize_state() :: map()
  @callback set_mapping(space_id :: integer(), plugin_id :: integer()) :: :ok

  @callback on_plugin_attach(plugin_id :: integer, space_id :: integer) :: :ok
  @callback on_plugin_detach(space_id :: integer) :: :ok | :error

  defmacro __using__(_) do
    quote do
      @behaviour HorizonSdk.PackageBehavior

      def attach_package(package_id, workspace_id), do: :ok
      def register_package(params), do: :ok
      def package_registered?(package_id, workspace_id), do: false

      def attach_plugin(plugin_id, space_id), do: :ok
      def plugin_attachable?(plugin_id, space_id, schema), do: false
      def plugin_attached?(space_id), do: false
      def get_plugin_id_attached(space_id), do: nil

      def initialize_mapping, do: %{}
      def initialize_state, do: %{}
      def set_mapping(space_id, plugin_id), do: :ok

      def on_plugin_attach(plugin_id, space_id), do: :ok
      def on_plugin_detach(space_id), do: :ok

      defoverridable attach_package: 2,
                     attach_plugin: 2,
                     register_package: 1,
                     package_registered?: 2,
                     plugin_attachable?: 3,
                     plugin_attached?: 1,
                     get_plugin_id_attached: 1,
                     initialize_mapping: 0,
                     initialize_state: 0,
                     set_mapping: 2,
                     on_plugin_attach: 2,
                     on_plugin_detach: 1
    end
  end
end

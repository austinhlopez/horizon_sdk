defmodule HorizonSdk.PackageBehavior do
  @moduledoc """
  Horizon's package callbacks are used to
  register packages and attaach plugins.
  """

  @callback attach_package(
              package_id :: integer,
              workspace_id :: integer
            ) :: :ok | :error
  @callback register_package(params :: map) :: :ok | :error
  @callback package_registered?(package_id :: integer, workspace_id :: integer) :: boolean

  @callback plugin_attachable?(plugin_id :: integer, space_id :: integer, schema :: map) ::
              boolean
  @callback plugin_attached?(plugin_id :: :integer, space_id :: integer) :: boolean
  @callback plugin_attached?(space_id :: integer) :: boolean
  @callback get_plugin_id_attached(space_id :: integer) :: integer | nil

  @callback attach_plugin(plugin_id :: integer, space_id :: integer) :: :ok | :error
  @callback detach_plugin(space_id :: integer) :: :ok | :error
end

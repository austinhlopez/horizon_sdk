defmodule HorizonSdk.APIAdapters.SpaceServerAdapterState do
  @moduledoc """
  """

  defstruct [
    :api_server_pid,
    :pubsub_module,
    :hook_channel_topic,
    :dest_user_id,
    :dest_session_id
  ]

  @type t :: %__MODULE__{
          api_server_pid: pid(),
          hook_channel_topic: String.t(),
          pubsub_module: atom(),
          dest_user_id: integer() | nil,
          dest_session_id: integer() | nil
        }
end

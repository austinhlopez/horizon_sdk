defmodule HorizonSdk.APIAdapters.SpaceServerAdapterState do
  @moduledoc """
  """

  defstruct [:api_server_pid, :pubsub_module, :hook_channel_topic]

  @type t :: %__MODULE__{
          api_server_pid: pid(),
          hook_channel_topic: String.t(),
          pubsub_module: atom()
        }
end

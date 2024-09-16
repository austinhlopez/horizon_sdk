defmodule HorizonSdk.Adapters.InternalAdapter do
  @behaviour HorizonSdk.ApiBehavior

  def run_post(
        %{pubsub_module: pubsub_module, api_channel_topic: api_channel_topic} = adapter,
        fn_name,
        args
      ) do
  end

  def run_get(adapter, hook_name, args) do
  end
end

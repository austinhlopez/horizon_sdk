import Config

config :ex_json_schema,
       :remote_schema_resolver,
       fn path ->
         File.read!(Path.join([File.cwd!(), "json_schemas", path])) |> Jason.decode!()
       end

%{
  configs: [
    %{
      name: "default",
      files: %{
        excluded: [
          ~r"/_build/",
          ~r"/deps/",
          ~r"/assets/",
          ~r"/lib\/horizon_sdk\/host/",
          ~r"/lib\/horizon_sdk\/math/",
          ~r"/lib\/horizon_sdk\/mode/",
          ~r"/lib\/horizon_sdk\/participant/",
          ~r"/lib\/horizon_sdk\/seeds/",
          ~r"/lib\/horizon_sdk\/visual/",
          ~r"/lib\/horizon_sdk_web\/channels/",
          ~r"/lib\/horizon_sdk_web\/controllers/",
          ~r"/lib\/horizon_sdk_web\/views/",
          ~r"/test\/horizon_sdk_web\/controllers/",
          ~r"/test\/horizon_sdk_web\/views/"
        ]
      },
      plugins: [],
      requires: [],
      strict: true,
      color: true,
      checks: [
        {Credo.Check.Design.AliasUsage, false},
        {Credo.Check.Design.TagTODO, false},
        {Credo.Check.Readability.ModuleDoc, false},
        {Credo.Check.Refactor.Nesting, [max_nesting: 3]},
        {Credo.Check.Warning.IoInspect, false}
      ]
    }
  ]
}

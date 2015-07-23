use Mix.Config

config :relisa,
  targets: [
    { System.get_env("FLAMBO_HOST"), System.get_env("FLAMBO_SSH_KEY") }
  ],
  hooks: [
    pre: ["phoenix.digest"]
  ]

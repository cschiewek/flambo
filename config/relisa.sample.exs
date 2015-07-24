use Mix.Config

config :relisa,
  targets: [
    { "user@host", "/home/flambo/.ssh/id_rsa" }
  ],
  hooks: [
    pre: ["phoenix.digest"]
  ]

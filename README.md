# Flambo
[![Build Status](https://semaphoreci.com/api/v1/cschiewek/flambo/branches/master/shields_badge.svg)](https://semaphoreci.com/cschiewek/flambo)

<img src="http://orig12.deviantart.net/bfcb/f/2013/162/f/b/flambo_by_darkhatboy-d68ln2x.png" height="200px" />

Flambo is a super simple outgoing webhook slack bot, built with [Phoenix](http://phoenixframework.org).

## Getting up and running
0. Configure your bot and get an API key
1. Install Erlang and Elixir
2. Install dependencies with `mix deps.get`
3. Generate your secret configs `mix flambo.secret` and add relevant keys
4. Start Flambo with `mix run --no-halt`
5. Invite your bot to whatever channels you want

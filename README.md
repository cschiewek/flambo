# Flambo
[![Build Status](https://semaphoreci.com/api/v1/cschiewek/flambo/branches/master/badge.svg)](https://semaphoreci.com/cschiewek/flambo)

<img src="http://orig12.deviantart.net/bfcb/f/2013/162/f/b/flambo_by_darkhatboy-d68ln2x.png" height="200px" />

Flambo is a super simple outgoing webhook slack bot, built with [Phoenix](http://phoenixframework.org).

## Getting up and running
1. Install Erlang, Elixir and nodejs
2. Install dependencies with `mix deps.get`
3. Generate your secret configs `mix flambo.secret` and add relevant keys
3. Start Flambo with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

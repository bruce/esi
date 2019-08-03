#!/bin/sh

rm lib/esi/api.ex lib/esi/api/*.ex
curl https://esi.evetech.net/latest/swagger.json > _build/dev/lib/esi/priv/swagger.json
mix esi.generate
mix compile
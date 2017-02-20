# ESI

## Examples

```elixir
ESI.API.Insurance.prices()
|> ESI.request()
{:ok, result}
```

```elixir
ESI.API.Insurance.prices()
|> ESI.request!()
result
```

## Development

Download ESI's `swagger.json` to `priv/`

Then run:

```
$ mix esi.generate
```
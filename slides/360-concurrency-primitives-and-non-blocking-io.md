## Concurrency primitives and non-blocking IO

```playground
require "http/client"

channel = Channel(String).new

spawn do
  channel.send(HTTP::Client.get("http://example.com").body)
end

spawn do
  channel.send(HTTP::Client.get("http://ruby.org").body)
end

2.times do
  puts channel.receive
end
```

Note:
TBD: playground is breaking here

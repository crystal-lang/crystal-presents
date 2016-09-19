## Overloads

```playground
def foo(x : String)
  "Got string: #{x}"
end

def foo(x : Int32)
  "Got int: #{x}"
end

puts foo("hello")
puts foo(1)
puts foo(rand < 0.5 ? "world" : 2)
```

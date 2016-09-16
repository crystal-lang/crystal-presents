## Valid Ruby & Crystal programs

```playground
def foo(x)
  raise "no x given!" unless x

  x + 1
end

x = rand < 0.5 ? 1 : nil
p foo(x) # => 2 or nil
```

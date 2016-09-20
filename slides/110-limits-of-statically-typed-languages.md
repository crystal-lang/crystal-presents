## Limits of statically typed languages

```playground
def foo(a)
  if a >= 0
    a
  else
    nil
  end
end

foo(rand()) + 1
```

Note:
This program never fails in Ruby at runtime, but doesn't compile in Crystal. So, Crystal sometimes discards valid programs because it can't know the value of things, only their types.

## Limits of statically typed languages

```playground
def foo(a)
  if a >= 0.1
    a
  else
    nil
  end
end

foo(rand()).not_nil! + 1
```

Note:
But if something change, things will fail. But it's just that we are lying to ourselves.
A better approach is always to first try to program believing on what the compiler tell us. Writer safer programs.


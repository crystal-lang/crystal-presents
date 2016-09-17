---
transition: fade
---
## Limits of statically typed languages

```playground
def foo(a)
  if a >= 0
    a
  else
    nil
  end
end

foo(rand()).not_nil! + 1
```

Note:
We can add not_nil! To tell the compiler to *trust us* regarding the type of the expression.
It won't complain, as is on us to not break this.

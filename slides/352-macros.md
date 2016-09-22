---
transition: slide-out fade-in
---

## Macros

```playground
macro define_method(name, &block)
  def {{name.id}}
    {{block.body}}
  end
end

define_method :greet do
  puts "hello"
end

greet
```

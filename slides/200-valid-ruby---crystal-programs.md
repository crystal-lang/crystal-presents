---
transition: fade
---
## Crystal programs

```playground
x = rand < 0.5 ? 1 : nil
if x
  puts x + 1
else
  puts "no x"
end
```

Note:
Compiler figures out that "x" can't be nil in the first branch

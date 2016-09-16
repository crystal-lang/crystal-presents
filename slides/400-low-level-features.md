## Low-level features

```playground
ptr = Pointer(Int32).malloc(1)
ptr.value = 10
ptr.value # => 10

a = 1
ptr_a = pointerof(a)
ptr_a.value = 2
a # => 2
```

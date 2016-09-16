## Crystal is statically typed

What happens when we **compile** the same program in Crystal?

```playground
x = 1
puts x

puts x.undefined
```

Note:
Crystal is compiled. It works like this: first a program (the compiler) checks whether the program is correct, given some definition of correctness. If it is, an executable is created. Then you can invoke this executable without needing the compiler anymore. This has some other benefits that will be addressed later.

In the above case, the compiler noticed that `a` is an integer, and integers don't have an `undefined` method, so the compiler gives an error and doesn't produce an executable. The meaning of correctness for Crystal is "no `NoMethodError` at runtime".

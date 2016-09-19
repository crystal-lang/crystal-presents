## Crystal is statically typed

What happens when we **compile** the same program in Crystal?

```playground
if ARGV.empty?
  x = "hello"
else
  x = nil
end

puts x.size
```

Note:
The compiler doesn't know what will happen at runtime, whether there will be command line arguments or not, so it analyses both branches. It then concludes that `a` will be either an integer or a string. It will then check that both integer and string respond to a `+` method accepting an integer. Because there's no such method for `String`, the compiler will give an error and refuse to produce an executable. This is because otherwise it will break the promise of never ever giving a `NoMethodError` at runtime.

In a statically typed language, the compiler eventually assigns a unique type to every variable and expression in your program. We say Crystal is statically typed with a twist because in the example above `a` has a unique type: "either integer or string". We call this a union type: a union of integer or string, denoted `Integer | String`. (Crystal actually has several integer types for several byte sizes. The default integer type is 4 bytes size big, `Int32`, so the correct union type in this case is `Int32 | String`)

Note that statically typed languages are usually associated with explicit type declarations, but this isn't necessarily true. In the previous examples we never used type declarations but the compiler still assigned a type to everything. Another part of the twist is that Crystal is like that: it almost never requires type annotations from you, much less than in any other statically typed language.

Why do we need some type annotations in Crystal? We'll come back to this later.

Back to our question: is the program valid? **Probably** not, right? This "probably" means that we might have forgotten considering a case.

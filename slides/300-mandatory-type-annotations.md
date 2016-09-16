## Mandatory type annotations

```playground
class Person
  def initialize(age : Int32)
    @age = age
  end
end
```

Note:

One difference between Ruby and Crystal is that in Crystal we have to tell the compiler, somehow, the type of instance variables.
In this case we didn't explicitly say that `@age` is String, but the compiler could figure it out from the initialize declaration.

We believe this is something good for the compiler (faster compilations) and for a human. Did it happen to you to browser a project and to have no idea what is the type of instance vars of a class, for example in a Rails project? You loose time trying to deduce this over and over. And in most cases the class author already knows the types, either because they designed it at some point or, because of tests and experimentation it concluded them. Making these types go along the code, as a contract, is good.

